object ForComprehensionUebung3 {
  def main(args: Array[String]): Unit = {
    val colors = List("Red", "Green", "Blue")
    val fruits = List("Apple", "Banana", "Orange")
    val pairs = for {
      color <- colors
      fruit <- fruits
    } yield (color, fruit)
    println(pairs)
  }
}