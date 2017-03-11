echo "99bottles:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/99bottles.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "BinarySearch:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/BinarySearch.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "Calendar:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/Calendar.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "ComplexNumbers:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/ComplexNumbers.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "DrawStuff:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/DrawStuff.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "Factorial:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/Factorial.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "GCD:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/GCD.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "HeapSort:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/HeapSort.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "Life:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/Life.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "Multiplicator:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/Multiplicator.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "NewtonsMethod:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/NewtonsMethod.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "OptimalChange:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/OptimalChange.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "Polymorphism:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/Polymorphism.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "PrimeTest:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/PrimeTest.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "QuickSort:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/QuickSort.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "ScalarProduct:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/ScalarProduct.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "Simple:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/Simple.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "Sudoku:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/Sudoku.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
echo "VehicleRent:"
sbt run < ~/Documents/compiler/punkt0-parser-stubs-v2/testprograms/lab3/valid/VehicleRent.p0 > out
tail -n+4 out | sbt run > out2
diff out out2
