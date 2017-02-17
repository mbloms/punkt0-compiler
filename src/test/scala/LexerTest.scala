// import org.scalacheck.Properties
// import org.scalacheck.Prop.forAll
// import org.scalacheck.Gen
// import org.scalacheck.Gen.{someOf, oneOf, const, nonEmptyListOf,
//   identifier, frequency}
// import org.scalacheck.Arbitrary
// import org.scalacheck.Arbitrary.arbitrary
// import main.Lexer.{NonTerminal,Terminal,State}
// import cats.syntax.functor._
//
// object StateSpecification extends Properties("State") {
//
//   def genTerminal[T](genT: Gen[T]) : Gen[Terminal[T]] =
//     genT map ((x: T) => Terminal(x))
//
//   def genNT[T](genT: Gen[T]): Gen[NonTerminal[T]] =
//     const(NonTerminal())
//
//   def genState[T](genT: Gen[T]): Gen[State[T]] =
//     oneOf(genNT(genT), genTerminal(genT))
//
//   implicit lazy val arbState = Arbitrary(genState(arbitrary[Int]))
//
//   property("functor left id") = forAll { (state : State[Int]) => {
//     state.map(identity) == state
//   }}
//
// }
