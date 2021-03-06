// addSbtPlugin("ch.epfl.scala" % "sbt-bloop" % "1.4.5-4-07d519dc") //1.4.5")

shellPrompt := {
  val lambda = new String(Character.toChars(0x3bb));
  state => s"$lambda: ${Project.extract(state).currentProject.id}> "
}
