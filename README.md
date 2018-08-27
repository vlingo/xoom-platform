# vlingo-platform

[![Build Status](https://travis-ci.org/vlingo/vlingo-platform.svg?branch=master)](https://travis-ci.org/vlingo/vlingo-platform)

[Official vlingo/platform website](https://vlingo.io/).

Provides vlingo/platform central "build all" and other control. [Read about the vlingo/platform](https://kalele.io/blog-posts/vlingo-platform/) and about [its architecture](https://kalele.io/blog-posts/vlingo-platform-architecture-part1/).

Use "mvn install" from here with the pom.xml and the entire platform to build.

```
console:vlingo-platform> mvn install
```

## Maintaining the Libraries

### Synchronizing Library Versions

- see [build.gradle](build.gradle) for the list of repos, versions and replacement regexes
- adjust the config
- if the directories are checked out already next to this repo, make sure, the right branches (`master`) are checked out, and all changes are committed
- run `gradle` or `./gradlew`
- alternatively, run `gradle syncVersions` without checking out automatically
- review and commit the repos

### Travis to Bintray

Create a `.travis.yml` file with build statements. You must create a `deploy.key` in this file using the following command-line tool:

```
travis encrypt <YOUR BINTRAY API KEY> --add deploy.key
```
You get your Bintray API key from your Bintray user user profile:

```
  Username-drop-menu > Edit Profile > API Key (left bar menu)
```

License (See LICENSE file for full license)
-------------------------------------------
Copyright © 2012-2018 Vaughn Vernon. All rights reserved.

This Source Code Form is subject to the terms of the
Mozilla Public License, v. 2.0. If a copy of the MPL
was not distributed with this file, You can obtain
one at https://mozilla.org/MPL/2.0/.
