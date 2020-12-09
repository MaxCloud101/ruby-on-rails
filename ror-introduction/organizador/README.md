# README

## Load environment

- Load bash profile
```
source $HOME/.bash_profile
```
Change Ruby version
```
rvm use ruby-2.7.1
```
Change Node version
```
nvm use v12.18.3
```
## Used Command

- Create project with postgres conexion
```
rails new organizador -T --database=postgresql
```
- Add boostrap
```
yarn add bootstrap jquery popper.js roboto-fontface
```
- To create new classes with simple form and boostrap
```
rails g simple_form:install --bootsrap
```
- Create Category and Task 
```
rails g scaffold Category name:string description:text 
rails g scaffold Task name:string description:text due_date:date category:references
```
- To see model informations
```
gem 'annotate'
```
- To run model annotations
```
annotate --models
```
- To see available locales
```
I18n.available_locales
```
- To add missing translations
```
i18n-tasks add-missing
```
- To automatically translante certain pattern we use
```
gem 'rails-i18n'
```
- To authentication we use
```
gem 'devise'
```
- To use devise
```
rails g devise:install
```
- To create model linked with device authentication
```
rails g devise User
```
- To run migrations
```
rails db:migrate
```
- To see all routes
```
rails routes
```
- To find certain routes
```
rails routes | grep notes
```
- To see routes in graphic interface
```
http://localhost:3000/rails/info/routes
```
- To add user to model task
```
rails g migration AddOwnerToTask user:references
```
- To restart db
```
rails db:reset
```
- To create participant role
```
rails g model Participant role:integer user:referenses task:references
```
- To use nested forms
```
gem 'cocoon'
```
- We need js in specific commit to use cocoon
```
yarn add github:nathanvda/cocoon#c24ba53
```
- To configure we do changes in
```
/code/organizador/app/javascript/packs/application.js
```
- To manage access we can do
```
gem 'cancancan'
```
- To create the abilitator
```
rails g cancan:ability
```
- To create Task migration
```
rails g migration addCodeToTask code:string
```
- To create email system
```
rails g mailer ParticipantMailer
```
- To previsualize emails we use a server or letter_opener
```
gem 'letter_opener'
```
- To add notes to tasks
```
rails g model Note body:text user:references task:references
```
- To load annotations to models
```
annotate --models
```
