#!/usr/bin/env bash

export https_proxy=127.0.0.1:1087
export http_proxy=127.0.0.1:1087

flutter packages pub publish --dry-run
flutter packages pub publish --server=https://pub.dartlang.org
#flutter pub publish -v