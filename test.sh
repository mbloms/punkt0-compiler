#!/bin/sh
sbt compile
sbt -v -J-Xss2m test:run
./testTokens.sh
./testAST.sh
./testType.sh
./testCompile.sh
