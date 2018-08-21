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

License (See LICENSE file for full license)
-------------------------------------------
Copyright © 2012-2018 Vaughn Vernon. All rights reserved.

This Source Code Form is subject to the terms of the
Mozilla Public License, v. 2.0. If a copy of the MPL
was not distributed with this file, You can obtain
one at https://mozilla.org/MPL/2.0/.
