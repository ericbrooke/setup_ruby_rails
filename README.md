#setup for new Mac OSX
=====

Ensure that commanbd line tools can access the shell environment:
```
Install Xcode command line - gcc
```

Setup Git
```
git config --global user.name "Your Real Name"
git config --global user.email me@example.com
git config -l --global
```
Setup ruby versioning:
Install RVM - ensure to set PATH

```
\curl -L https://get.rvm.io | bash -s stable --ruby
```
Use one file for additional paths open .bash_profile:
```
if [ -f ~/.bashrc ];
then
source ~/.bashrc
fi
```

open .bashrc in a text editor and add:
```
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
```

Faster Gem download
```
echo "gem: --no-document" >> ~/.gemrc
```
Install a pacakage management system for Mac OS X there are:
(HomeBrew)[http://brew.sh] and MacPorts

Install HomeBrew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Brew install redis

Download Postgres
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH" 



#setup for new rails app
=====
gem install rails

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

add into your spec_helper.rb:
config.include Capybara::DSL

edit READMe

git init
check .gitignore file
git add .
git commit -m "new app setup"
git remote add origin git@github.com:ericbrooke/app_name
git push origin master -u


#Getting started on the App
======
bin/rake db:create db:migrate

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

