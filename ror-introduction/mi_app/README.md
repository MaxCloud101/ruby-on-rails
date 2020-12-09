# README

## Load environment
- Load bash profile
```
source $HOME/.bash_profile
```
- Ruby version
```
rvm use ruby-2.7.1
```
- Change node version
```
nvm use v12.18.3
```
## Used Command
- Create Pet model
```
rails g model Pet name:string breed:string
```
- Run migrations
```
rals db:migrate
```
- Insert register in rails console
```
rails console
Pet.create name:'lulu', breed:'poodle'
```
- To edit credentials.yml.enc
```
EDITOR=nano rails credentials:edit
```
- To see added encripted variables
```
rails console
Rails.application.credentials.hello
```
-  To create model, view and controller
```
rails g scaffold Book title:string author:string description:text isbn:string pages_count:integer
```
- Guide to route styles
```
https://guides.rubyonrails.org/routing.html#resources-on-the-web
```
- To see migration states
```
rails db:migrate:status
```
- To use simple form gem
```
gem 'simple_form'
```
- To init simple form
```
rails generate simple_form:install
```
- To use simple form with haml
```
rails g scaffold User first_name:string last_name:string address:string about_me:text phone:integer
```
- To learn html to haml
```
https://htmltohaml.com/
```
- To manage automatically i18n
```
gem install i18n-tasks
```
- To add missing values
```
i18n-tasks add-missing
```
- To debug use
```
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'pry-doc'
```
