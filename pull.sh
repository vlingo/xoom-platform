#!/bin/bash
set -eou pipefail

VLINGO_PLATFORM_PATH=$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)
VLINGO_HOME=$(cd -- "$VLINGO_PLATFORM_PATH/.." >/dev/null 2>&1 ; pwd -P)
VLINGO_GITHUB_REPO="https://github.com/vlingo/{PROJECT}.git"
VLINGO_PROJECTS=($@)

all_projects=(
  "vlingo-platform"
  "vlingo-common"
  "vlingo-actors"
  "vlingo-streams"
  "vlingo-streams-tck"
  "vlingo-wire"
  "vlingo-cluster"
  "vlingo-directory"
  "vlingo-http"
  "vlingo-auth"
  "vlingo-symbio"
  "vlingo-symbio-dynamodb"
  "vlingo-symbio-geode"
  "vlingo-symbio-jdbc"
  "vlingo-lattice"
  "vlingo-lattice-exchange-camel"
  "vlingo-lattice-exchange-rabbitmq"
  "vlingo-schemata"
  "vlingo-telemetry"
  "vlingo-xoom"
  "vlingo-xoom-starter"
  "vlingo-build-plugins"
  "vlingo-examples"
  "vlingo-helloworld"
)

if [ ${#VLINGO_PROJECTS[@]} -eq 0 ]; then
  VLINGO_PROJECTS=("${all_projects[@]}")
fi

msg() {
  echo -e "\x1B[32m[VLINGO BUILD]\x1B[0m $1"
}

msg_scoped() {
  echo -e "\x1B[32m[VLINGO BUILD]\x1B[0m\x1B[33m[$1]\x1B[0m $2"
}

msg_error() {
  echo -e "\x1B[32m[VLINGO BUILD]\x1B[0m\x1B[31m[Error]\x1B[0m $1"
  exit 1
}

_show_config() {
  msg "VLINGO_PLATFORM_PATH: $VLINGO_PLATFORM_PATH"
  msg "VLINGO_HOME: $VLINGO_HOME"
  msg "VLINGO_GITHUB_REPO: $VLINGO_GITHUB_REPO"
  msg "VLINGO_PROJECTS: $(printf '%s ' ${VLINGO_PROJECTS[@]})"
}

_last_commit() {
  project=$1
  project_path="$VLINGO_HOME/$project"
  msg_scoped $project "Last commit: $(cd $project_path && git log --oneline -1)"
}

_clone_or_pull_project() {
  project=$1
  project_repo=$(echo $VLINGO_GITHUB_REPO | sed -e 's/{PROJECT}/'$project'/g')
  project_path="$VLINGO_HOME/$project"
  if [ -d $project_path ]; then
    (msg_scoped $project "Pulling in $project_path" && cd $project_path && git pull || msg_error "Failed to pull $project") || exit 255
  else
    (msg_scoped $project "Cloning to $project_path" && git clone $project_repo $project_path || msg_error "Failed to clone $project") || exit 255
  fi
}

_clone_or_pull() {
  projects="$@"
  printf "%s\0" ${projects[@]} | xargs -0 -I% -n 1 -P8 bash -c '_clone_or_pull_project %'
  printf "%s\0" ${projects[@]} | xargs -0 -I% -n 1 -P8 bash -c '_last_commit %'
}

_configure() {
  # exports for xargs/parallel runs
  export -f msg
  export -f msg_scoped
  export -f msg_error
  export -f _clone_or_pull_project
  export -f _last_commit
  export -p VLINGO_PLATFORM_PATH
  export -p VLINGO_HOME
  export -p VLINGO_GITHUB_REPO
}

help() {
  echo "Pull all or selected projects:"
  echo ""
  echo "  $0 [project...]"
  echo ""
  echo "Show help:"
  echo ""
  echo "  $0 help"
  echo ""
}

pull() {
  _configure
  _show_config
  _clone_or_pull ${VLINGO_PROJECTS[@]}
  msg "Done."
}

[ "${1:-}" == "help" ] && help && exit 0

pull
