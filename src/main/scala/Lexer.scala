package main;

import cats._
import cats.data._
import cats.implicits._

object Lexer {

  class Lexer[T] {

  }
  abstract class State[T]
  case class NonTerminal[T]() extends State[T]
  case class Terminal[T](token : T) extends State[T]

  implicit object StateFunctor extends Functor[State] {
    def map[A,B](fa : State[A])(f : A => B) : State[B] = fa match {
      case NonTerminal() => NonTerminal()
      case Terminal(token) => Terminal(f(token))
    }
  }

  // implicit object LexerFunctor extends Functor[Lexer] {
    // map[A,B](fa : Lexer[A])(f : A => B) = 
  // }

}
