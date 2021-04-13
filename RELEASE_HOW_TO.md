# The VLINGO XOOM Platform release process is as follows:

1. `cd xoom-platform`
2. `./release.sh 1.2.3`

- The release script will update `pom.xml` with the new version, commit it and tag a new release.
- `git tag` is very important because it triggers next projects to be released.
