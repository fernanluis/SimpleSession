# README

Creando una simple sesión basada en autentificación usando Ruby on Rails.

Proyecto que contiene dos modelos: Usuario e Item.

Contiene además 2 controladores: Usuarios e Items.

Usando, gem 'bcrypt' para almacenar hashes de contraseñas en la base de datos.

Usando bootstrap con enlace BootstrapCDN en el head application.html.erb
app/views/layouts/application.html.erb
Puedes poner su CSS personalizado en el custom.scss archivo creado a continuación
app/assets/stylesheets/custom.scss


rails generate controller Sessions, agregamos algunas rutas.
agregamos el form a sessions en new
Let's now implement the sessions controller.con métodos
Let's add the methods in the sessions helper.
Then we will import the session helper in the application controller
Ahora le pide que inicie sesión si visita la página del usuario (localhost:3000/users/:id) Una cosa mala es que si te registras, te pedirá que inicies sesión. Pero no tiene sentido iniciar sesión nuevamente después de registrarse. Arreglemos eso actualizando el método de creación en el archivo del controlador de usuarios y también agreguemos el enlace de inicio de sesión en la parte superior. He añadido el actualizado_header.html.erb archivo.
estoy en header modificando
