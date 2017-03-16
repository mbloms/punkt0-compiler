#!/bin/sh
sbt compile
./testTokens.sh
./testAST.sh
