#!/bin/bash
for file in ./testprograms/lab2/valid/*.p0
do
    echo $file;
    dirname=$(dirname $file)
    filename=$(basename $file .p0)
    scala -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --tokens $file | diff - $dirname/$filename.check;
done;
for file in ./testprograms/lab2/invalid/*.p0
do
    echo $file;
    output=$(scala -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --tokens $file 2>&1 >/dev/null)
    if [ $? -ne 1 ]
    then
        echo 'Error code not 1';
        exit 1
    fi;
    echo "$output"
    if [ -z "$output" ]
    then
        echo 'Empty output';
        exit 1
    fi
done


