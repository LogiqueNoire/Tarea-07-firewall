resource "docker_network" "persistencenet" {
    name = "persistencenet"
}

resource "docker_container" "redis" {
  name  = "redis"
  image = "redis:8.2.1"

  ports {
    internal = 6379
    external = 6000
  }

  networks_advanced{
    name = docker_network.persistencenet.name
  }
}

resource "docker_container" "postgres" {
  name  = "postgres"
  image = "postgres:13.22-bookworm"

  ports {
    internal = 5432
    external = 5000
  }

  env = ["POSTGRES_PASSWORD=1234"]

  networks_advanced{
    name = docker_network.persistencenet.name
  }

}



