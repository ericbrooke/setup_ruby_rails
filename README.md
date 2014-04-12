setup for new Mac OSX
=====

Install Xcode command line - gcc

Setup Git
$ git config --global user.name "Your Real Name"
$ git config --global user.email me@example.com
$ git config -l --global

Install RVM - ensure to set PATH
$ \curl -L https://get.rvm.io | bash -s stable --ruby
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

Faster Gem download
echo "gem: --no-document" >> ~/.gemrc
gem install rails

Install HomeBrew

Brew install redis

Download Postgres
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH" 

Setup .subl path

setup for new rails app
=====
check ruby and rails versions with rvm

setup gemset:
rvm use 2.1.1@app_name -- create -- default

# 3.2
rails new app_name --skip-test-unit

# 4.0
rails new py_website --skip-test-unit --database=postgresql

cd app_name

check gemfile add database
add the configuration into config/database.yml

check groups
add rspec-rails
bundle

rails generate rspec:install
bundle binstubs rspec-rails

edit READMe

git init
check .gitignore file
git add .
git commit -m "new app setup"
git remote add origin git@github.com:ericbrooke/app_name
git push origin master -u


Getting started on the App
======
git checkout -b first_feature
write first features test e.g. creating a resource
routes:
root "the first page"
resources

controller:
rails generate controller controller_name

controller#action:
def index
end

view

