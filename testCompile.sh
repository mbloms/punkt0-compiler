#!/bin/bash
for file in testprograms/lab5/valid/*.p0;
do
    echo $file;
    scala -cp ./target/scala-2.11/classes:./frege.jar:./lib/cafebabe_2.11-1.2.jar punkt0.Main -d classes $file || exit 1;
    java -cp classes Main > our.txt || exit 1;
    scala -cp ./punkt0_2.11-1.2.jar:./lib/cafebabe_2.11-1.2.jar punkt0.Main -d classes $file || exit 0;
    java -cp classes Main > theirs.txt || exit 0;
    diff our.txt theirs.txt;
done;
