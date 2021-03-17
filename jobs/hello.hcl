job "hello-job" {
  datacenters = ["dc1"]

  group "hello-group" {
    network {
      port "http" {
        static = "5678"
      }
    }
    task "server" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo"
        ports = ["http"]
        args = [
          "-listen",
          ":5678",
          "-text",
          "hello world",
        ]
      }


      service {
            name     = "hello-service"
            port     = "http"
            tags     = ["urlprefix-/hello"]

        check {
            type     = "http"
            path     = "/health"
            interval = "2s"
            timeout  = "2s"
        }
      }
    }
  }
}

