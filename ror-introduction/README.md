# ruby-on-rails
This project contain ruby on rails proyect and examples

* mi_app: Simple rails introduction
* organizador: Complete project example

## Commands

- Load bash profile to use rvm
```
source $HOME/.bash_profile
```
- Change ruby version

```
rvm use ruby-2.7.1
```
- Change NVM version for Ruby use
```
nvm use v12.18.3
```
- Install certain rails version
```
gem install rails -v 6.0.3
```
- Create ruby project without test
```
rails new mi_app -T
```
- Run rails server
```
rails server
```
- Kill ruby server
```
sudo fuser -k -n tcp 3000
```
- Para interactuar con la consola
```
rails console
```
- Precompile assets
```
bundle exec rails assets:precompile 
```
- Webpacker install
```
bundle exec rails webpacker:install
```
- Run webpack dev server
```
bin/webpack-dev-server 
```
