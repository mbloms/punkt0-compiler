import org.scalacheck.Gen
import org.scalacheck.Gen.{oneOf, listOf, lzy}
import org.scalacheck.Properties
import org.scalacheck.Prop.forAll
import org.scalacheck.Arbitrary
import org.scalacheck.Arbitrary.arbitrary

object TreeSpec extends Properties("Tree") {
  def genTree[T](genT: Gen[T]): Gen[Tree[T]] = lzy {
    oneOf(genLeaf(genT), genNode(genT))
  }

  def genLeaf[T](genT: Gen[T]): Gen[Leaf[T]] =
    genT map (Leaf(_))

  def genNode[T](genT: Gen[T]): Gen[Node[T]] = lzy {
    for {
      child1 <- genTree(genT)
      child2 <- genTree(genT)
    } yield Node((child1, child2))
  }

  implicit lazy val abrIntTree : Arbitrary[Tree[Int]] = Arbitrary(genTree(arbitrary[Int]))

  property("non-empty") = forAll { (tree : Tree[Int]) =>
    tree.size >= 1
  }

}
