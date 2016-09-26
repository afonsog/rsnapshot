# rsnapshot

Contenedor para el uso de Rspanshots basado en Alpine. Con este se podran hacer backups tanto de archivos locales como remotos, y ademas la posibilidad del envio de estos backups a un servidor remoto.

# Uso

* Se debe definir un volumen en donde se almacenaran los backups realizados por rsnapshot.
* Definir una variable de entorno llamada BACKUP_DIRECTORIES, esta debe ser una lista de directorios a realizar backups.
* Opcionalmente, definir una variable de entorno llamada PUSH_BACKUP. Esta sera la direccion de un servidor remoto en donde se copiaran los backups realizados por rsnapshot.

# Ejemplo de uso con docker-compose:

```
rsnapshot:
  container_name: rsnapshot
  image: gafonso21/docker-rsnapshot
  volumes:
    - rsnapshot-keys:/root/.ssh #Volumen con las claves ssh
    - rnapshots-bkp:/var/rsnapshot #Volumen que contiene los bkps
  environment:
    BACKUP_DIRECTORIES: |
                 /directory1  ./
                 /directory2  ./
                 /directory3  ./
    PUSH_BACKUP: root@ip.to.remote.server:/tmp/rsnapshots
  command: ["rsnapshot", "hourly"]
  
```  
  
  Segun el archivo de configuracion que se genere, en nuestro caso con command se pueden pasar las siguientes opciones:
  * command: ["rsnapshot", "hourly"]
  * command: ["rsnapshot", "daily"]
  * command: ["rsnapshot", "weekly"]
