resource "docker_network" "net_app" {
    name = "net_app"
}
resource "docker_container" "nginx_app_1" {
  name  = "nginx_app_1"
  image = "nginx:1.29.1"

  ports {
    internal = 80
  }

  volumes {
    host_path      = abspath("${path.module}/../host_volumes/web/app_1")
    container_path = "/usr/share/nginx/html"
  }

  networks_advanced{
    name = docker_network.net_app.name
  }
  networks_advanced{
    name = docker_network.persistence_net.name
  }
}

resource "docker_container" "nginx_app_2" {
  name  = "nginx_app_2"
  image = "nginx:1.29.1"

  ports {
    internal = 80
  }

  volumes {
    host_path      = abspath("${path.module}/../host_volumes/web/app_2")
    container_path = "/usr/share/nginx/html"
  }

  networks_advanced{
    name = docker_network.net_app.name
  }
  networks_advanced{
    name = docker_network.persistence_net.name
  }
}

resource "docker_container" "nginx_app_3" {
  name  = "nginx_app_3"
  image = "nginx:1.29.1"

  ports {
    internal = 80
  }

  volumes {
    host_path      = abspath("${path.module}/../host_volumes/web/app_3")
    container_path = "/usr/share/nginx/html"
  }

  networks_advanced{
    name = docker_network.net_app.name
  }
  networks_advanced{
    name = docker_network.persistence_net.name
  }
}



