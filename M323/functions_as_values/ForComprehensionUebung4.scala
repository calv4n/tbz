object ForComprehensionUebung4 {
  case class User(name: String, tasks: List[String])

  def main(args: Array[String]): Unit = {
    val users = List(
      User("Alice", List("Task 1", "Task 2", "Task 3")),
      User("Bob", List("Task 1", "Task 4", "Task 5")),
      User("Charlie", List("Task 2", "Task 3", "Task 6"))
    )
    val tasksCompleted = List("Task 1", "Task 3", "Task 5")
    val pendingTasks = for {
      user <- users
      task <- user.tasks
      if !tasksCompleted.contains(task)
    } yield (user.name, task)
    println(pendingTasks)
  }
}