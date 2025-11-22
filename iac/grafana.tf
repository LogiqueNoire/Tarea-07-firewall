resource "docker_network" "grafana_net" {
    name = "grafana_net"
}

resource "docker_container" "grafana_dev"{
    name = "grafana_dev"
    image = "grafana/grafana:12.2.0-17660687647-ubuntu"
    ports {
        internal = 3000
        external = 3100
    }

    networks_advanced{
        name = docker_network.grafana_net.name
    }
    networks_advanced{
        name = docker_network.net_app.name
    }
}