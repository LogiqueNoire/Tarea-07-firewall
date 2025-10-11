resource "docker_network" "grafananet" {
    name = "grafananet"
}

resource "docker_container" "grafana_dev"{
    name = "grafana_dev"
    image = "grafana/grafana:12.2.0-17660687647-ubuntu"
    ports {
        internal = 3000
        external = 3100
    }

    networks_advanced{
        name = docker_network.grafananet.name
    }
    networks_advanced{
        name = docker_network.net_app.name
    }
}