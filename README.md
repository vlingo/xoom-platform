# VLINGO/PLATFORM

[![Build](https://github.com/vlingo/vlingo-platform/workflows/Release/badge.svg)](https://github.com/vlingo/vlingo-platform/actions?query=workflow%3ARelease) [![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/vlingo-platform-java/community)

The VLINGO/PLATFORM central "build all" and other control.

Docs: https://docs.vlingo.io/

[Official VLINGO/PLATFORM website](https://vlingo.io/).

[Read about the VLINGO/PLATFORM](https://docs.vlingo.io/) and about [its architecture](https://docs.vlingo.io/architecture).

## Getting started

Prerequisites:
* Java JDK 8 or greater

## Maintaining the Libraries

### Release process

See [RELEASE_HOW_TO](RELEASE_HOW_TO.md) for the release process.

### Build configuration

- GitHub Organisation secrets
  - `BINTRAY_USERNAME` - Your Bintray user account name
  - `BINTRAY_PASSWORD` - Your Bintray user **API Key**, **NOT** your Bintray user account password
  - `RELEASE_GITHUB_TOKEN` - Use the token on the VLINGO org
  - `DEPLOY_GITHUB_TOKEN` - GitHub token for publishing to GitHub packages
  - `SLACK_WEBHOOK` - Webhook for slack notifications, can be generated [here](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks)

The Bintray API key can be obtained from your Bintray user profile:

```
  Username-drop-menu > Edit Profile > API Key (left bar menu)
```

## Deployment to Pivotal Cloud Foundry

You can refer to [this link](PivotalCloudFoundry/DEPLOY.md) to read the documentation about how to deploy to Pivotal Cloud Foundry platform.

In our [examples repository](https://github.com/vlingo/vlingo-examples) you have an example of how to deploy two services working together.


License (See LICENSE file for full license)
-------------------------------------------
Copyright © 2012-2020 VLINGO LABS. All rights reserved.

This Source Code Form is subject to the terms of the
Mozilla Public License, v. 2.0. If a copy of the MPL
was not distributed with this file, You can obtain
one at https://mozilla.org/MPL/2.0/.
