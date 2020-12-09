4 Proyecto de curso: primeros pasos

4.1 Que vamos a desarrollar

Sistemas de gestion de tareas

- Gestion de sesion de usuarios
- Gestion de registro de usuarios
- Gestion de accesso y permisos
- Gestion de tareas
- Gestion de participantes y mensajes en tareas
- Gestion de categorias de tareas
- Envio de email


Load Bash profile to use RVM

source $HOME/.bash_profile

Cambiamos la version de rails para el proyecto

rvm use ruby-2.7.1

Cambiamos la version de NodeJS

nvm use v12.18.3

Para iniciar el proyecto con postgresql usamos:

rails new organizador -T --database=postgresql

Luego agregamos algunas librerias de javascript

yarn add bootstrap jquery popper.js roboto-fontface

Agregamos las gemas

gem 'hamlit'
gem 'hamlit-rails'
gem 'simple_form'
gem 'pry'
gem 'pry-doc'


4.2 Diseñando el modelo de datos

- Category
- Task
- Note
- Participant
- User

La imagen se encuentra en /modelodatos.png

4.3 Construye los primeros scaffolds del proyecto

Instalamos simple_form y lo asociamos al bootstrap, con esto las plantillas ahora estaran directamentes enlazadas con el frontend

rails g simple_form:install --bootstrap

Ahora vamos a crear las categorias

rails g scaffold Category name:string description:text

Ahora vmos a crear un task

rails g scaffold Task name:string description:text due_date:date category:references

Ahora vamos a crear la db en postgresql

rails db:create

y posteriormente

rails db:migrate

Para poder ver los atributos en cada modelo podemos usar la gema annotate

gem 'annotate'

Para crear las anotaciones usamos

annotate --models

4.4 Internacionalizando los modelos

Creamos los archivos es.yml y simple_form.es.yml, y lanzamos I18n-task

i18n-tasks add-missing

Para realizar la traduccion automatica de ciertos patrones, podemos usar la gema rails-i18n y la agregamos al Gemfile

gem 'rails-i18n'

4.5 Agregando validaciones al modelo

La validaciones se puede agregar a los modelos, como se muestra en:

/app/models/task.rb
/app/models/category.rb

5 Proyecto del curso: usuarios

5.1 Anadiendo el concepto de usuarios

Vamos a usar la gem 'device' para trabajar con la autenticacion

 gem 'device'

Para generar los archivos necesarios usaremos

rails g devise:install

Ahora asociamos devise con el modelo de usuario final

rails g devise User

Para ver las rutas generadas para user puedes usar:

rails routes

o puedes revisar de forma grafica en la web en

http://localhost:3000/rails/info/routes

Para permitir el accesso solo a usuarios autenticados agregamos a aplicacion_controller

before_action :authenticate_user!

para agregar el cerrar sesion usamos link_to en

/app/views/layouts/application.html.erb

5.1 Asignando un propietario a la tarea

Vamos a crear una migracion manual para poder enlazar la llave de la tarea junto con la asignacion del usuario.

rails g migration AddOwnerToTask user:references

Luego acomodamos la migracion y agregamos las relaciones necesarias como en 

task.rb
user.rb

Si tenemos algun error podemos reiniciar la base de datos usando

rails db:reset

4.3 Añadiendo participantes a la tarea

vamos a agregar el modelo partifipantes

rails g model Participant role:integer user:references task:references

Ahora vamos a todos los modelos y agregamos correctamente sus relaciones

4.4 Creando formularios anidados

Vamos a usar la gem 'cocoon' para anidas formularios

gem 'cocoon'

Para esto necesitamos instalar su dependencia con yarn en la consola

yarn add github:nathanvda/cocoon#c24ba53

Agregamos la dependecia de javascript en:

/app/javascript/packs/application.js

Ahora agregamos un plugin para la instalacion en webpack en:

/config/webpack/environment.js

Ahora agregamos participantes en el form usando los archivos

/app/views/tasks/_form.html.haml
/app/views/tasks/participanting_user_fields.html.haml

4.5 Interactuando con Cocoon para anidar formularios

4.6 CanCan: ¿puedes hacerlo?

Agregamos la gema cancan y eliminamos las de spring por problemas de compatibilidad

gem 'cancancan'

luego inicializamos la libreria

rails g cancan:ability

Ahora vamos a agregar el manejo en 

app/models/ability.rb

y load_and_authorize_resource en 

task_controller

6.1 Callbacks en Rails

Sirve para afectar las peticiones en una parte del ciclo de vida de la aplicacion

Ahora vamos a agregar una migracion

rails g migration addCodeToTask code:string

Ahora vamos a crear un before_create en Task como la funcion

def create_code

Los callbacks se pueden crear en los controllers y los modelos

6.2 Añadiendo datos semilla

6.3 Enviando e-mails a los participantes

6.4 Añadiendo notas a la tarea

Agregamos el modelo notas

rails g model Note body:text user:references task:references

6.5 Añadiendo notas con AJAX

Para esto vamos a introducir toda la logica en:

/app/views/tasks/notes/_note.html.haml
/app/views/tasks/notes/create.js.erb

