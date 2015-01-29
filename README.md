#Setup for new Mac OSX

There are two paths to follow one for a new computer and one for another account on the same computer which is alreadly being used for development.

Follow the steps for the desired setup:

A - New Computer, first account

B - Extra User account

The most annoying thing about having seperate accounts is Music (aside of permissions). Guess that could be solved by putting your iTunes library in a shared folder..

## Optional - Download iTerm
I prefer iTerm to Terminal

http://iterm2.com

##A + B - Xcode

Install Xcode from the App store. Or ensure it is installed. Make sure it has being opened and and agreement is agreed.
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

Now open xcode and agree to the terms. You will need to do this once before proceeding.

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
It should respond with
```
user.name=Eric Brooke
user.email=ericbrooke@mac.com
```
These are stored in your home directory in .gitconfig file.

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

If a new Mac User account none of these three file will exist.  Thus just create a .bashrc file.

```
touch .bashrc
atom .bashrc
```
copy the contents of .bashrc from the file.  Than create .bash_profile and add the following:
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

# Modify command line format and colours for rvm
export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\](\$(~/.rvm/bin/rvm-prompt v p g s)) \$(__git_ps1 [%s]) \n→  \[\033[1;30m\]\$\[\033[0m\]"
# OR use the following for rbenv
#export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\](\$(rbenv version-name)) \$(__git_ps1 [%s]) \n  \[\033[1;30m\]\$\[\033[0m\]"

```

If you are going to use rbenv instead of rvm (Ruby Management) you will need to change this part of the line:
```
\$(~/.rvm/bin/rvm-prompt v p g s)
```
To:
```
\$(rbenv version-name)
```

*.bash_profile*
```
if [ -f ~/.bashrc ];
then
 source ~/.bashrc
fi
```
I have my file with extra alias commands if you wish to add them.

##A - Install a package management system 

For Mac OS X there are:
[HomeBrew](http://brew.sh) and MacPorts

Install HomeBrew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### B - Setup Homebrew for mutiple user account use in Mac OS X
This tricky and you may need to apply this rule in a number of places, particularly if you are adding to your user after the fact. Each user account will need to be admin, to be able each of packages.

set umask for for each user first. (.basrc or .profile or .bash_profile)
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
now each user who is in staff group can use brew install.

If you intend to share brews amongst mutiple users you may have have to given the staff group permission to read/write and excute. For example if you are using mysql brew you may need to edit permissions in here /usr/local/var/mysql to share mysql. Note that your database files are stored here so you may not wantt to share access to these amongst the group as well as the owner.

To note that Homebrew stores downloads to Library/caches/.. and you will need to change permissions, as homebrew will try to read from this folder first before dowloading.

##B - Add your keys to your new account

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
##A - Setup up connection with github with a new account

If this is a new computer you will need to create a SSH key. These are the github [instructions](https://help.github.com/articles/generating-ssh-keys/)

```
ls -al ~/.ssh
# Lists the files in your .ssh directory, if they exist
```
If this directory does not exit create a new ssh key
```
ssh-keygen -t rsa -C "your_email@example.com"
# Creates a new ssh key, using the provided email as a label
# Generating public/private rsa key pair.
# Enter file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]
```
You can setup the key with a paraphrase if you wish, your ssh will be stronger and more secure
```
# start the ssh-agent in the background
eval "$(ssh-agent -s)"
# Agent pid 59566
ssh-add ~/.ssh/id_rsa
```
Copy the public key 
```
pbcopy < ~/.ssh/id_rsa.pub
# Copies the contents of the id_rsa.pub file to your clipboard
```
Add it to your git hub account. Make sure all is good with
```
ssh -T git@github.com
```
Common issue - [Error: Permission denied (publickey)](https://help.github.com/articles/error-permission-denied-publickey/)

##A - Setup ruby version management - RVM or rbenv - choose one

You could use RVM or Bundler/rbenv. Here is a [comparsion](http://jonathan-jackson.net/rvm-and-rbenv)

###RVM
Install [RVM](http://rvm.io) - ensure to set PATH

```
\curl -L https://get.rvm.io | bash -s stable --ruby
```

open .bashrc in a text editor and add:
```
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
```
###rbenv
Install [rbenv](https://github.com/sstephenson/rbenv#homebrew-on-mac-os-x)

```
brew install rbenv ruby-build
rbenv init
```
Install a version of ruby
```
# list all available versions:
$ rbenv install -l

# install a Ruby version:
$ rbenv install 2.2.0
```
Set the Ruby to use.  You can do it via directory or via global
```
rbenv global 2.2.0
rbenv rehash #use this command after every new ruby install
```
Faster Gem download
```
echo "gem: --no-document" >> ~/.gemrc
```

### A + B Gems you will want

```
gem install bundler
```

##B - If you alreadly have RVM installed

If you already have RVM installed, update it to the latest version and install Ruby:
```
rvm get stable --autolibs=enable
rvm install ruby
rvm --default use ruby-2.1.3
```

##B Setup for existing rails codebase

create dev folder in the user folder

git clone the code base into dev
move into the codebase folder

specify ruby and gemset you want before you bundle:
```
rvm use 2.2.0@gem_set_name --create
echo "gem: --no-document" >> ~/.gemrc
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
Add to your bash file i.e. .bashrc
```
PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH" 
```
Its worth noting that the 9.4 is the version of the app, thus it will work if you have old 9.3 version installed.  
###A - MySQL
```
brew install mysql
```

Ensure that mysql functions:
```
mysql.server start
```
If not:
```
brew remove mysql
brew cleanup
sudo rm -rf /usr/local/var/mysql/
brew install mysql
mysql.server start
```
Remember this useful command for mysql
```
brew info mysql
```

##A Node

```
brew install node
```

[npm](https://docs.npmjs.com) is the node package manager

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
rails new app_name --skip-test-unit --database=postgresql --git
```
For JavaScript front end you may not need turbolinks or jquery
```
--skip-javascript
```
Want to understand options for a new rails app?
```
rails new --help
```

##Setup for the rails application
```
cd app_name
git init
```

##check gemfile and setup gems

This is my standard startup gemfile
[Gemfile](gemfile)

[RSpec](https://github.com/rspec/rspec-rails) and [Capybara](https://github.com/jnicklas/capybara) for testing

Run bundle, to dowload and install the gems in your gemfile
```
bundle
```

###RSpec
For unit, integration testing
```
rails generate rspec:install
bundle binstubs rspec-core # for rails 4
```
Your ./bin directory will get populated with binstubs for every gem in the bundle that has executables. However, you won't need most of those binstubs since developers generally just use a few like rake, rspec and similar.

###[Capybara](https://github.com/jnicklas/capybara)

You will have to make a choice about JavaScript testing.

I use [Poltergist](https://github.com/teampoltergeist/poltergeist)
```
brew install phantomjs
```
Add to your test file
```
Capybara.javascript_driver = :poltergeist
```
###[Annotate](https://github.com/ctran/annotate_models)
This adds to each of your models comments with your database schema
```
rails g annotate:install
```
Edit options I usuaully change the postion to after.  This is where it stores the comment schema

###[Simplecov](https://github.com/colszowka/simplecov)
This is great for seening where you have tested in your code and where you have not

Add into your spec_helper
```
require 'simplecov'
SimpleCov.start
```
##check database

add the configuration into config/database.yml

rename readme to readme.md
```
mv README.rdoc readme.md
```
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

##Optional 

###setup iTerm

* Setup profiles to open into the projects folder
* ensure gemset correct
* create preferred screen setup
* Set unlimited scrollback in the Profiles -> Terminal tab

###setup atom
[git integration](http://blog.atom.io/2014/03/13/git-integration.html)
Packages I use
* Linter Rubocop

##Issues

###nokogiri libiconv is missing

This is an on-going problem with Mac OSX and the gem nokogiri https://github.com/sparklemotion/nokogiri/issues/442#issuecomment-55483013
