trait Tree[T] {
  def size: Int
}

case class Leaf[T](
  item: T
) extends Tree[T] {
  def size = 1
}

case class Node[T] (
  children: (Tree[T], Tree[T])
) extends Tree[T] {
  def size = children._1.size + children._2.size
}

