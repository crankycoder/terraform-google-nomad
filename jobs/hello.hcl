job "cranky-demo" {
  datacenters = ["dc1"]
    group "cranky-demo" {
      task "cranky-demo" {
        driver = "docker"
          config {
            image  = "crankycoder/demo:0.0.1"
            args = [
                "-e",
                "LOG_LEVEL=10",
                "-it",
                "-p",
                "8000:8000" 
            ]
          }
      }
    }
}
