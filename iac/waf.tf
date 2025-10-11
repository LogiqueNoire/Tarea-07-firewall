resource "docker_container" "waf_nginx" {
  name  = "waf_nginx"
  image = "owasp/modsecurity-crs:3.3.7-nginx-202510030310"

  ports {
    external = 850
    internal = 8080
  }

  networks_advanced {
    name = docker_network.net_app.name
  }

  volumes {
    host_path      = abspath("${path.module}/../host_volumes/waf_conf")
    container_path = "/etc/nginx/conf.d"
    read_only      = true
  }

  depends_on = [
    docker_container.proxy_nginx_dev
  ]
}