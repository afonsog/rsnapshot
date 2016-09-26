# rsnapshot

Contenedor para el uso de Rspanshots basado en Alpine. Con este se podran hacer backups tanto de archivos locales como remotos, y ademas la posibilidad del envio de estos backups a un servidor remoto.

Uso

* Se debe definir un volumen en donde se almacenaran los backups realizados por rsnapshot.
* Definir una variable de entorno llamada BACKUP_DIRECTORIES, esta debe ser una lista de directorios a realizar backups.
* Opcionalmente, definir una variable de entorno llamada PUSH_BACKUP. Esta sera la direccion de un servidor remoto en donde se copiaran los backups realizados por rsnapshot.

Por defecto rspanshot se ejecuta: rsnapshot hourly
