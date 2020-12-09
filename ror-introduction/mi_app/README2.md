1 - Introduccion
1.1 Bienvenida
1.2 Que es ruby on rails y porque usasrlo

Rails el Framework

- Comprension conceptual
- Apredizaje JIT
- Principio DRY
- Convenciones sobre configuraciones
- Esta disenado para construir rapido
- Esta disenado para automatizar
- Sin sorpresas

Manifiesto Agil

- Individuos e interacciones sobre procesos y herramientas
- Software funcionando sobre documentacion extensiva
- Colaboracion con el cliente sobre negociacion contractual
- Respuesta ante el cambio sobre seguir un plan

2 - Entorno de desarrollo

2.1 Entorno de desarrollo en ruby on rails

Modulos escenciales de ROR

- ActiveRecord
- Layouts and rendering
- ActionView
- ActionController
- Rails routing
- ActiveSupport
- Rails API
- ActionMailer
- ActiveStorage
- ActiveJob
- ActionCable
- The Assets pipeline
- Rails Caching
- Rails Testing
- Internationalization i18n
- Rails JS

2.2 Instalacion de Ruby, RoR en Linux

2.3 Instalacion de Ruby, RoR en Mac y Windows

3 - Nuestra primera aplicacion

3.1 Entender la web con rieles

3.2 Primeros pasos con ruby on rails

- Load Bash profile to use RVM

source $HOME/.bash_profile

- Cambiamos la version de rails para el proyecto

rvm use ruby-2.7.1

- Cambiamos la version de NodeJS

nvm use v12.18.3

- Para recibir ayuda

rails new -h

- Para crear el proyecto y evitar la creacion de test

rails new mi_app -T

3.3 Entender el enrutamiento basico

Para renderizar un html basico

- Creamos la ruta en routes.rb
- Creamos el controllador en /app/controller/
- Creamos la vista en /app/views/welcome/

Ejemplo:

- Ruta get 'hola'
- Controlador /app/controller/welcome_controller.rb
- Vista /app/views/welcome/hello.html

Para instalar todas las librerias

bundle install

Para iniciar el servidor:

rails server

Si necesita verificar la integridad de algunos archivos lanzamos:

yarn install --check-files

Para matar el servidor lanzamos

sudo fuser -k -n tcp 3000

Si requiere instalar webpack

bundle exec rails webpacker:install

3.4 Manipular el patron MVC

Vamos a usar rails generate que nos permite utilizar ciertas estructuras de codigo predisenadas

rails g model Pet name:string breed:string

Esto va a crear una clase en: /app/models/pet.rb y una migracion en /db/migrate/xxxxxxxxxxx_create_pets.rb

Para iniciar la migracion corremos

rails db:migrate

Ahora para pasar una varaible del controlador a la vista creamos una varaible de instancia en welcome_controller como @variable y modificamos las vista de /app/views/welcome/hello.html a /app/views/welcome/hello.html.erb, para indicar que debe leer codigo rails antes de renderizar codigo html

Ahora para probar nuestro modelo usaremos la consola de rails

Pet.create name: 'lulu', breed: 'poodle'

3.5 Los secretos de Rails

En la verion 6 de rails tenemos

- database.yml
- credentials.yml.enc
- storage.yml

Para editar el archivo usamos:

EDITOR=nano rails credentials:edit

Agregamos la variable hello: 123456 y para verla en la consola de rails usamos:

Rails.application.credentials.hello

Este valor tambien se puede agregar al controlador sin problemas

3.6 Assets y Layouts

Que son los assets?

Insumos que las respuestas HTML y otras, necesitan para operar funcional y esteticamente bien en el cliente (CSS, HTML, IMG, FONTS, ...)

Se neseita tener algunos sistemas para manejar los asssets:

- Optimizacion
- Caching
- Ofuscacion
- Seguridad

El asset pipeline

TRANSFORMER -> CONCATENATOR -> COMPRESSOR -> FINGERPRINTER

(sass1, css1, ...) -> manifest(css1 + ...) -> (css1 + ...) -> v1(css1 + ...)

Layouts

Las vistas html se pueden descomponer en parciales, esto nos permitira llevar un mejor orden

Webpacker

Rails utiliza webpacker para el desarrollo moderno, y webpacker utiliza yarn.

3.7 Agregar el primer conjunto de scaffolds

Con escaffold no solo se integra el patron MVC, si no el sistema de assets tambien.

rails g scaffold Book title:string author:string description:text isbn:string pages_count:integer

Luego debemos usar rails db:migrate

Para ver las rutas que se generan automaticamente poder revisar la documentacion en: 

https://guides.rubyonrails.org/routing.html

Para ver la lista de libros vamos a:

http://localhost:3000/books

En /app/views/books podemos ver todas las vistas necesarias para manejar la data de la base de datos

3.8 Como funcionan la migraciones

Migraciones

db/migrate se encuentra cada uno de los procesos donde se hacen migraciones sobre las tablas, en schema_migrations vamos a condenzar las estructuras que hemos generado alrededor de los modelos.

Para ver el estado de las migraciones usamos

rails db:migrate:status

3.9 Optimiza tu codigo con HAML

Para revisar documentacion vamos a:

https://github.com/haml/haml

pero esto puede impactar en el rendimiento, para esto en rails debemos usar hamlit

https://github.com/k0kubun/hamlit

Para instalar agregamos en el Gemfile la gema

gem 'hamlit'

y en el ambiente de development

gem 'hamlit-rails'

ahora instalamos las gemas usando

bundle install

renombramos el archivo /app/views/welcome/hello.html.haml

3.10 Agiliza la construcción de formularios con Simple Form

Para revisar la documentacion vamos a

https://github.com/heartcombo/simple_form

Agregamos la gema al Gemfile

gem 'simple_form'

Ahora para instalar simple_form usamos:

rails generate simple_form:install

ahora vamos a generar un nuevo modelo usando simple_form:

rails g scaffold User first_name:string last_name:string address:string about_me:text phone:integer

Ahora vamos a establecer la nueva migracion del modelo users

rails db:migrate

Podemos la creacion de todos los elementos del tipo haml en /app/views/users

3.11 Soporte de varios idiomas para tu aplicación

Vamos a usar i18n para internacionalizar nuestra aplicacion

Vamos a tener el idioma ingles en /config/locales/en.yaml y vamos a crear el idioma espanol en

/config/locales/es.yaml

Para establecer el idioma podemos ir al controllador y setearlo, como en:

/app/controllers/users_controller.rb

Tambien podemos aplicarlo a todos los controladores como en:

/app/controllers/application_controller.rb

Para automatizar la creacion de task usamos la gema i18n-tasks que no es necesaria instalar en el proyecto

gem install i18n-tasks

Para crear los tag usamos

i18n-tasks add-missing

3.12 Debugging: detecta los errores en tu código

Para esto vamos a utilizar la gema byebug que viene por defecto en el Gemfile

ponemos "byebug" donde deseemos hacer un breakpoint para debug

Para continuar con la ejecucion una vez realizado el breakpoint apretamos "c"

Tambien podemos usar pry para hacer debug, agregamos al Gemfile en development

gem 'pry'
gem 'pry-doc'

y donde queramos debugear y hacer el breakpoint colocamos

binding.pry

por ejemplo para ver los metodos disponibles podemos usar

ls Book.first.title





