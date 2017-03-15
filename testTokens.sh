#!/usr/bin/env fish
for file in ./testprograms/lab2/valid/*.p0
    set -l dirname (dirname $file);
    set -l filename (basename $file .p0);
    scala -cp ./target/scala-2.11/classes:./frege3.24.100.jar punkt0.Main --tokens $file | diff - $dirname/$filename.check;
end;

