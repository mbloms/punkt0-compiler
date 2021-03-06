#!/bin/bash
for file in testprograms/lab3/valid/*.p0;
do
    echo $file;
    java -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --ast $file | diff - $file.ast || exit 1
done;
for file in testprograms/lab3/invalid/*.p0;
do
    echo $file;
    output=`java -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --ast $file 2>&1 >/dev/null`;
    if [ $? -ne 1 ]
    then
        echo 'Exit code not 1';
        exit 1;
    fi;
    echo "$output"
    if [ -z "$output" ]
    then
        echo 'Empty output';
        exit 1;
    fi;
done;
