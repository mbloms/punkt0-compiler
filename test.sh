#!/bin/sh
sbt compile
sbt -v -J-Xss2m test:run || exit 1
./testTokens.sh || exit 1
./testAST.sh || exit 1
./testType.sh || exit 1
#./testCompile.sh || exit 1
