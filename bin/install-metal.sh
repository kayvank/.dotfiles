#!/usr/bin/env bash
set -euo pipefail

# Make sure to use coursier v1.1.0-M9 or newer.
curl -L -o coursier https://git.io/coursier-cli
chmod +x coursier
./coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=emacs \
  org.scalameta:metals_2.12:0.9.10+111-f2471a14-SNAPSHOT  \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o ~/.local/bin/metals-emacs -f
