#Setup for new Mac OSX

There are two paths to follow one for a new computer and one for another account on the same computer which is alreadly being used for development.

Follow the steps for the desired setup:

A - New Computer, first account

B - Extra User account

##A + B - Xcode

Install Xcode from the App store. Or ensure it is installed
```
xcode-select -p
```
If it responds with a path it is installed.

Ensure that command line tools can access the shell environment:
```
xcode-select --install
```

Ensure it is installed
```
gcc --version
```
##A + B - Text Editor

Setup your text editor to open from command line:

*Do not run your text editor from your downloads folder move it to Applications folder*

1. Atom - Install Shell Commands from the Atom menu
2. [Sublime](https://www.sublimetext.com/docs/2/osx_command_line.html)

##A + B - Setup Git
```
git config --global user.name "Your Real Name"
git config --global user.email me@example.com
git config -l --global

```
For Atom users:
```
git config --global core.editor "atom --wait"
```
or for Sublime change the last line to
```
git config --global core.editor "subl -n -w"
```

##A + B - Setup one file for Bash PATH Management

There are three that can have opinions on this:
* .profile
* .bash_profile
* .bashrc
* 
Mac OS X checks in this order  ~/.bash_profile, ~/.bash_login, and ~/.profile

Use one file for additional paths open .bash_profile and .profile and add the following:
```
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
```

##A + B - Copy Bash features into a current user account

Open and copy the contents from .bashrc file and .bash_profile

*.bashrc*

```
# Define bash colours
source ~/.bash_colours.bash

# Setup Git completion
source ~/.git-completion.bash

# Modify command line format and colours
export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\](\$(~/.rvm/bin/rvm-prompt v p g s)) \$(__git_ps1 [%s]) \n→  \[\033[1;30m\]\$\[\033[0m\]"
```

*.bash_profile*
```
if [ -f ~/.bashrc ];
then
 source ~/.bashrc
fi
```
I have my file with extra alias commands if you wish to add them.

##A - Setup ruby version management

You could use RVM or Bundler/rbenv. I am using RVM

Install RVM - ensure to set PATH

```
\curl -L https://get.rvm.io | bash -s stable --ruby
```

Faster Gem download
```
echo "gem: --no-document" >> ~/.gemrc
```

open .bashrc in a text editor and add:
```
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
```

##B - If you alreadly have RVM installed

If you already have RVM installed, update it to the latest version and install Ruby:
```
rvm get stable --autolibs=enable
rvm install ruby
rvm --default use ruby-2.1.3
```

##A - Install a package management system 

For Mac OS X there are:
[HomeBrew](http://brew.sh) and MacPorts

Install HomeBrew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### B - Setup Homebrew for mutiple user account use in Mac OS X

set umaskfor each user first. (.basrc or .profile or .bash_profile)
```
umask 0002 # group write permission
```

then give group write permission to /usr/local recursively:
```
sudo chmod -R g+w /usr/local/
```
then change owner to staff
```
sudo chgrp -R staff /usr/local
```
now each user who is in staff group can use brew install

##B Add your keys to your new account

You may need to copy over your id_rsa.pub and id_rsa found in the .ssh directory

You may need change the permissions on these files:
```
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa.pub

```

If you had forward agents setup in a config file you will also need to set it up.

Check github is all good with:
```
ssh -T git@github.com
```
##B Setup for exisitng rails codebase

create dev folder in the user folder

git clone the code base into dev
move into the codebase folder

specify ruby and gemset you want before you bundle:
```
rvm use 2.1.3@gem_set_name --create
bundle
rake db:migrate
```

##A - Install Redis
```
Brew install redis
```
##A -Install Database systems

You will to download and setup a service for each

###A - Postgres
Download [Postgres](http://postgresapp.com)
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH" 

###A - MySQL

```
brew install mysql
```
Remember this useful command for mysql
```
brew info mysql
```

##A + B - Setup for new rails app

```
gem install rails
```

Choose a name for your application and replace app_name below with your name.

check ruby and rails versions with rvm

setup gemset:

syntax = rvm use ruby_version@app_name -- create -- default
```
rvm use 2.1.2@app_name -- create -- default
```
### For rails 3.2
```
rails new app_name --skip-test-unit
```
### For rails 4.0
```
rails new app_name --skip-test-unit --database=postgresql
```
##Setup for the rails application
```
cd app_name
git init
```

check gemfile add database

add the configuration into config/database.yml

check groups
add rspec-rails
bundle

```
rails generate rspec:install
bundle binstubs rspec-rails
```

add into your spec_helper.rb:
```
config.include Capybara::DSL
```

rename readme to readme.md
edit READMe

check .gitignore file

```
git add .
git commit -m "new app setup"
git remote add origin git@github.com:ericbrooke/app_name
git push origin master -u
```

#Getting started on the App
======
```
bin/rake db:create db:migrate
git checkout -b first_feature
```
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
