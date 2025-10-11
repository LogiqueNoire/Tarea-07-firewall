Pasos para el Despliegue

Clona el repositorio y navega a la raíz del proyecto.

Opcional) Limpieza Inicial: Si tienes versiones anteriores de los contenedores, ejecuta una destrucción total para empezar desde un estado limpio.
    Bash

```
  cd iac/
  terraform destroy --auto-approve
  cd ..
  sudo rm -rf host_volumes
```

Ejecuta el Playbook de Ansible: Este comando creará los directorios, copiará las configuraciones de NGINX y desplegará los archivos estáticos de las aplicaciones.
Bash
```
cd config/
ansible-playbook playbook.yml
cd ..
```
Ajusta los Permisos (Paso Crítico): El contenedor del WAF necesita permisos de escritura en su carpeta de configuración para poder arrancar. Ejecuta el siguiente comando desde la raíz del proyecto:
Bash
```
sudo chmod -R 777 host_volumes/waf_conf/
```
Aplica la Configuración de Terraform: Finalmente, levanta toda la infraestructura de contenedores.
Bash
```
cd iac/
terraform init  # Solo la primera vez
terraform apply --auto-approve
```
