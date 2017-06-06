#!/bin/sh
sbt $TRAVIS_SCALA_VERSION compile
sbt -v -J-Xss2m $TRAVIS_SCALA_VERSION test:run
./testTokens.sh
./testAST.sh
./testType.sh
./testCompile.sh
