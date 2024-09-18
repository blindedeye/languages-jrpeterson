// src/main/scala/HelloWorldServer.scala

import akka.actor.typed.ActorSystem
import akka.actor.typed.scaladsl.Behaviors
import akka.http.scaladsl.Http
import akka.http.scaladsl.marshallers.sprayjson.SprayJsonSupport._
import spray.json.DefaultJsonProtocol._
import akka.http.scaladsl.server.Directives._
import akka.http.scaladsl.model.StatusCodes

import scala.io.StdIn
import scala.concurrent.Future

object HelloWorldServer {

  def main(args: Array[String]): Unit = {
    // Create an ActorSystem
    implicit val system = ActorSystem(Behaviors.empty, "helloWorldSystem")
    implicit val executionContext = system.executionContext

    // Define the route
    val route =
      path("sortStrings") {
        post {
          entity(as[List[String]]) { strings =>
            val sortedStrings = strings.sortWith(_ < _)
            complete(sortedStrings)
          }
        }
      } ~
      path("greet" / Segment) { person =>
        get {
          complete(s"Hello, $person!")
        }
      }

    // Start the server
    val bindingFuture = Http().newServerAt("localhost", 8080).bind(route)

    println("Server online at http://localhost:8080/\nPress RETURN to stop...")
    StdIn.readLine() // Keep the server running until user presses return
    bindingFuture
      .flatMap(_.unbind()) // Unbind from the port
      .onComplete(_ => system.terminate()) // Terminate the system when done
  }
}
