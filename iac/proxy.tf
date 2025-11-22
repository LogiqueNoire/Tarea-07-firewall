resource "docker_container" "proxy_nginx_dev" {
  name = "proxy_nginx_dev"
  image = "nginx:1.29.1-perl"
/* Ya no se expone el hacia el exterior
  ports {
    external = 8800
    internal = 8080
  }
*/
  networks_advanced {
    name = docker_network.net_app.name
  }
  networks_advanced{
    name = docker_network.net_proxy.name
  }

  volumes {
    host_path       = abspath("${path.module}/../host_volumes/nginx_conf")
    container_path  = "/etc/nginx/conf.d"
    read_only       = false
  }

  depends_on = [
    docker_container.nginx_app_1,
    docker_container.nginx_app_2,
    docker_container.nginx_app_3
  ]

}

resource "docker_network" "net_proxy" {
  name = "net_proxy"
}