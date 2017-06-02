#!/bin/bash
for file in testprograms/lab7/valid/*.p0;
do
    echo $file;
    scala -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --print --symid $file 2>&1 >/dev/null || exit 1;
done;
for file in testprograms/lab5/valid/*.p0;
do
    echo $file;
    scala -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --print --symid $file 2>&1 >/dev/null || exit 1;
done;
for file in testprograms/lab5/invalid/*.p0;
do
    echo $file;
    output=`scala -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --print --symid $file 2>&1 >/dev/null`;
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
