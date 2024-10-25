# Usamos una imagen base de PHP con Apache
# Esta imagen ya tiene configurado PHP en su versión 7.4 junto con el servidor web Apache.
FROM php:7.4-apache

# Instalamos las extensiones necesarias para PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copiamos el código de nuestra aplicación al contenedor
# El directorio donde Apache espera que esté alojada la aplicación web para poder servirla.
COPY src/ /var/www/html/

# Exponemos el puerto 80 para el servidor web
# Que es el puerto por defecto donde los servidores web (como Apache) escuchan conexiones HTTP.
# Esto nos permite acceder a la aplicación web a través del navegador, ya que el contenedor estará "abriendo" este puerto para las conexiones externas.
EXPOSE 80

# Finalmente, este comando ejecuta Apache en modo foreground. 
# Esto significa que el servidor Apache se inicia y queda corriendo en el primer plano, permitiendo que el contenedor continúe en ejecución y sirviendo la aplicación web.
CMD ["apache2-foreground"]

#Nuestro Dockerfile configura un contenedor con PHP 7.4 y Apache,
#instala las extensiones de PHP necesarias para trabajar con bases de datos MySQL, 
#copia el código de la aplicación y expone el puerto 80 para que la aplicación sea accesible desde el exterior.