class A {
  var x : Int = 3;
  def foo() : Unit = {
    println(x)
  }
}
object Main extends App {
  new A().foo()
}
