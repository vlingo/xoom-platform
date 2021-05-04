#!/bin/bash
set -eou pipefail

XOOM_PLATFORM_PATH=$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)
XOOM_HOME=$(cd -- "$XOOM_PLATFORM_PATH/.." >/dev/null 2>&1 ; pwd -P)
XOOM_GITHUB_REPO="https://github.com/vlingo/{PROJECT}.git"
XOOM_PROJECTS=($@)

all_projects=(
  "xoom-platform"
  "xoom-common"
  "xoom-actors"
  "xoom-streams"
  "xoom-streams-tck"
  "xoom-wire"
  "xoom-cluster"
  "xoom-graphql"
  "xoom-directory"
  "xoom-http"
  "xoom-auth"
  "xoom-symbio"
  "xoom-symbio-dynamodb"
  "xoom-symbio-geode"
  "xoom-symbio-jdbc"
  "xoom-lattice"
  "xoom-lattice-exchange-camel"
  "xoom-lattice-exchange-rabbitmq"
  "xoom-schemata"
  "xoom-telemetry"
  "xoom-turbo"
  "xoom-designer"
  "xoom-build-plugins"
  "xoom-examples"
  "xoom-helloworld"
)

if [ ${#XOOM_PROJECTS[@]} -eq 0 ]; then
  XOOM_PROJECTS=("${all_projects[@]}")
fi

msg() {
  echo -e "\x1B[32m[XOOM]\x1B[0m $1"
}

msg_scoped() {
  echo -e "\x1B[32m[XOOM]\x1B[0m\x1B[33m[$1]\x1B[0m $2"
}

msg_error() {
  echo -e "\x1B[32m[XOOM]\x1B[0m\x1B[31m[Error]\x1B[0m $1"
  exit 1
}

_show_config() {
  msg "XOOM_PLATFORM_PATH: $XOOM_PLATFORM_PATH"
  msg "XOOM_HOME: $XOOM_HOME"
  msg "XOOM_GITHUB_REPO: $XOOM_GITHUB_REPO"
  msg "XOOM_PROJECTS: $(printf '%s ' ${XOOM_PROJECTS[@]})"
}

_last_commit() {
  project=$1
  project_path="$XOOM_HOME/$project"
  msg_scoped $project "\x1B[32m$(git branch --show-current)\x1B[0m last commit: $(cd $project_path && git log --oneline -1)"
}

_clone_or_pull_project() {
  project=$1
  project_repo=$(echo $XOOM_GITHUB_REPO | sed -e 's/{PROJECT}/'$project'/g')
  project_path="$XOOM_HOME/$project"
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
  export -p XOOM_PLATFORM_PATH
  export -p XOOM_HOME
  export -p XOOM_GITHUB_REPO
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
  _clone_or_pull ${XOOM_PROJECTS[@]}
  msg "Done."
}

[ "${1:-}" == "help" ] && help && exit 0

pull
