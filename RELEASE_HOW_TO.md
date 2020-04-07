# The vlingo/PLATFORM release process is as follows:

1. `cd vlingo-platform`
2. edit `pom.xm`l -- update the version; this version will be released (e.g. 1.2.3)
3. `git add pom.xml`
4. `git commit -m 'Release v1.2.3'`
5. `git tag '1.2.3' -m 'Release v1.2.3'`
6. `git push --follow-tags`

- `git tag` is very important because it triggers next projects to be released.
