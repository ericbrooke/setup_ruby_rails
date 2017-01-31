#Setup for new Mac OSX

There are two paths to follow one for a new computer and one for another account on the same computer which is already being used for development.

Follow the steps for the desired setup:

* A - *New Computer*, first account
OR
* B - *Extra User account* - Avoid this is if its your first time.
The most annoying thing about having separate accounts is Music (aside of permissions). Guess that could be solved by putting your iTunes library in a shared folder..

## Working on the command line
You will need to use the Application Terminal found in the Applications/Utilities Folder

## When changing the PATH

Close the terminal window, as the PATH changes will not be picked up

## Step 1 - Identify your access to Unix core
Your computer will have the application Terminal installed. I use [iTerm](http://iterm2.com), download it and move it to the Apllication folder.

## Step 2 - A + B - Xcode

_Why do I need it?_ Cos Apple did not install this for you and annoying things will happen later without it. And you need a C complier which comes with Xcode

Install Xcode from the App store. Or ensure it is installed. Make sure it has being opened and and agreement is agreed.
```
xcode-select -p
```
If it responds with a path it is installed.

Ensure that command line tools can access the shell environment:
```
xcode-select --install
```

Ensure gcc is installed, it is the C compiler which you will need to build your Ruby and stuff
```
gcc --version
```
You should see something like this:
```
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
Apple LLVM version 6.1.0 (clang-602.0.53) (based on LLVM 3.6.0svn)
Target: x86_64-apple-darwin14.5.0
Thread model: posix
```

Now open xcode and agree to the terms. You will need to do this once before proceeding.

## Step 3 - A + B - Text Editor/IDE

_Why do I need it?_ - You need someting to write your code in something, pen and paper may allow you but the excution will be a bitch.

Setup your text editor to open from command line (I like Atom):

Choose which, install it and ensure it is in teh Application folder, then setup command line access (i.e. from your iTerm or Terminal):

1. [Atom](https://atom.io) - Install Shell Commands from the Atom menu
1. [Sublime](https://www.sublimetext.com/docs/2/osx_command_line.html)

Set Your Editor variable in Bash:
```
export EDITOR="atom -nw"
```
OR
```
export EDITOR='subl -w'
```

## Step 4 - A + B - Setup Git

Why do I need it? - Git is your Version control, you need it to rollback code to earlier version and allows you to experiement with confidence.  It is also essential for work with teams and GitHub.

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

## Step 5 - A + B - Setup one file for Bash PATH Management

_Why do I need it?_ Having one place to update and change is really helpful, rather then mutiple files  :-)

There are three that can have opinions on this:
* .bash_profile
* .profile
* .bashrc

Mac OS X checks in this order  ~/.bash_profile, ~/.bash_login, and ~/.profile

Note ~ means your User folder i.e. /Users/ericbrooke. If you are not sure which user directory you are in use the pwd command.

If a new Mac User account none of these three file will exist.  Thus just create a .bashrc file.

```
cd ~
touch .bashrc
atom .bashrc
```

Than you will need create .bash_profile file: 
```
touch ~/.bash_profile
atom ~/.bash_profile
```
and add the following into the file:

```
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
```
This helps to ensure there is one place where all the BASH setup for each new terminal screen follows

## Step 6 - A + B - Copy Bash features into a current user account

_Why do I need it?_ Consider this is a script of things you want on your BASH (Terminal Command Line), auto completition for git branch names and filenames, colours, which git branch you are in and what ruby version are really useful.

Copy two files from this repo:
* .bash_colours.bash
* .git-completion.bash

When you copy them ensure you look at the RAW version, so extra whitespace or newlines will sneek in.

To create a new file just type:
```
touch ~/.bash_colours.bash
atom ~/.bash_colours.bash
```
Copy contents of .bash_colours.bash from github this repo (scroll to the top) and paste it into your file in atom. The ~/ is to ensure that is in the top directory for your user account.  When you open the file in github, click on the RAW button, then select All (Command A), Copy (Command C) and then paste (Command V) in *YOUR* file. Using RAW avoids and newline/ CR mischeif

Repeat this process for .git-completion.bash
```
touch ~/.git-completion.bash
atom ~/.git-completion.bash
```

Open and copy the contents from .bashrc file in this repo, here it is:

*.bashrc*

```
# Define bash colours
source ~/.bash_colours.bash

# Setup Git completion
source ~/.git-completion.bash

# Modify command line format and colours 
# with no ruby version
export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\] \$(__git_ps1 [%s]) \n→  \[\033[1;30m\]\$\[\033[0m\]"
# for rvm
# export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\](\$(~/.rvm/bin/rvm-prompt v p g s)) \$(__git_ps1 [%s]) \n→  \[\033[1;30m\]\$\[\033[0m\]"
# OR use the following for rbenv
#export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\](\$(rbenv version-name)) \$(__git_ps1 [%s]) \n  \[\033[1;30m\]\$\[\033[0m\]"

# OR use the following for chruby
# source /usr/local/share/chruby/auto.sh
# export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\] \$(cat .ruby-version) \$(__git_ps1 [%s])  \[\033[1;30m\]\$\[\033[0m\]"

# alias bash
alias cd..="cd .."
alias l="ls -al"
alias lp="ls -p"
alias h=history

# alias git
alias gs="git status"
alias gco= "git checkout"

# alias test coverage
alias coverage="open ./coverage/index.html"

# for rails dev
alias rakenuke="bin/rake db:{drop,create,migrate,seed,test:prepare}"

# Add RVM to PATH for scripting
# export PATH="$PATH:$HOME/.rvm/bin"
```
The #alias are my preferred commands of the things I use a lot, so I reduce them as I do them A LOT

## Step 7 - B Only - If you already have RVM installed

If you already have RVM installed, update it to the latest version and install Ruby:
```
if [ -f ~/.bashrc ];
then
 source ~/.bashrc
fi
```
I have my file with extra alias commands if you wish to add them.

## Step 8 - A - Install a [Package Management System](https://en.wikipedia.org/wiki/Package_manager)

_Why do I need it?_ There will be many extra things as a developer you will need to install later whether it be your ruby management system, redis, imagemagick.

For Mac OS X there are:
[HomeBrew](http://brew.sh) and MacPorts

Install HomeBrew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Step 9 - B - Setup Homebrew for multiple user account use in Mac OS X
This tricky and you may need to apply this rule in a number of places, particularly if you are adding to your user after the fact. Each user account will need to be admin, to be able each of packages.

set umask for for each user first. (.bashrc or .profile or .bash_profile)
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

If you intend to share brews amongst multiple users you may have have to given the staff group permission to read/write and execute. For example if you are using mysql brew you may need to edit permissions in here /usr/local/var/mysql to share mysql. Note that your database files are stored here so you may not want to share access to these amongst the group as well as the owner.

To note that Homebrew stores downloads to Library/caches/.. and you will need to change permissions, as homebrew will try to read from this folder first before downloading.

## Step 10 - B - Add your keys to your new account

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
## Step 11 - A - Setup up connection with [Github](www.github.com) with a new account

_Why do I need it?_ So your computer can talk to Github and push/pull code.

If this is a new computer you will need to create a SSH key. These are the github [instructions](https://help.github.com/articles/generating-ssh-keys/)

```
ls -al ~/.ssh
# Lists the files in your .ssh directory, if they exist
```
If this directory does not exit create a new ssh key. You can setup the key with a paraphrase if you wish, your ssh will be stronger and more secure.

```
ssh-keygen -t rsa -C "your_email@example.com"
# Creates a new ssh key, using the provided email as a label
# Generating public/private rsa key pair.
# Enter file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]
```

Check to see if your ssh works
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
Add it to your git hub account, on their wwebsite. In your Settings -> SSH Keys

Make sure all is good with with your computer talking to github.
```
ssh -T git@github.com
```
Common issue - [Error: Permission denied (publickey)](https://help.github.com/articles/error-permission-denied-publickey/)

## Step 12 - A - Setup ruby version management - choose one

_Why do it need it?_ In your future there are likely to be several versions of ruby on your machine, maybe with different Gem sets for each.

_Options_ You could use RVM or Bundler/rbenv or chruby. Here is a [comparsion of rvm and rbenv](http://jonathan-jackson.net/rvm-and-rbenv) and [here](https://gistlog.co/daqo/db4de42c9dea0a7d2a03) is a comparison between chruby and RVM

###Chruby

Install [chruby](https://github.com/postmodern/chruby)
``` brew install chruby```

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
$ rbenv install 2.3.0
```
Set the Ruby to use.  You can do it via directory or via global
```
rbenv global 2.3.0
rbenv rehash #use this command after every new ruby install
```
add the following to your .bashrc file. If you miss this step it will state you do not have permissions
```
eval "$(rbenv init -)"
```
### Faster Gem download
```
echo "gem: --no-document" >> ~/.gemrc
```

### Add ruby version to command line
In your .bashrc file you have two commented out lines which give you this for both RVM and rbenv. Choose which one you want and comment out or delete the others
```
# Modify command line format and colours 
# with no ruby version
export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\] \$(__git_ps1 [%s]) \n→  \[\033[1;30m\]\$\[\033[0m\]"
# for rvm
# export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\](\$(~/.rvm/bin/rvm-prompt v p g s)) \$(__git_ps1 [%s]) \n→  \[\033[1;30m\]\$\[\033[0m\]"
# OR use the following for rbenv
#export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\](\$(rbenv version-name)) \$(__git_ps1 [%s]) \n  \[\033[1;30m\]\$\[\033[0m\]"
```

### Step 13 - A + B Gems you will want
_Why do I need it?_ You are going to use a lot of Gems (consider them as software alreadly written for you i.e. software libraries) and then you need to manage the independicies between the Gems and which ones are installed. Avoid this (well to some degree) with lovely [Bundler](http://bundler.io)
```
gem install bundler
```

## Step 14 - B - If you alreadly have RVM installed

If you already have RVM installed, update it to the latest version and install Ruby:
```
rvm get stable --autolibs=enable
rvm install ruby
rvm --default use ruby-2.3.0
```
## Step 15 - A Setup for existing rails codebase

Create dev (lowercase) folder in the user folder.  This will be use to store all your coding projects

You will need to download the [github Application](https://desktop.github.com). Move it into your Applications folder.
Ensure you save into your "dev" folder. You will be asked details for your github account.

Check the readme of the application usually README.MD to install all the things that application needs. The basics will be:
```
bundle
```
if it does not know where bundler is you have a problem with your Ruby Management for rbenv run - rbenv rehash.  Most Rails projects will have  a database.yml.example file, you will need to duplicate this and remove .example of the end of the name.
```
rakenuke
```
This will create your database, migrate and seed.

## Step 15 - B Setup for existing rails codebase

Create dev (lowercase) folder in the user folder.  This will be use to store all your coding projects

git clone the code base into dev
move into the codebase folder

specify ruby and gemset you want before you bundle:
```
rvm use 2.3.0@gem_set_name --create
echo "gem: --no-document" >> ~/.gemrc
bundle
rake db:migrate
```

## Step 16 - A - Optional Install of [Redis](http://redis.io)
```
brew install redis
```
Use to start up the redis server, it will take a window in your terminal.
```
redis-server
```
To test that redis is all good:
```
$redis-cli
127.0.0.1:6379> ping
PONG
127.0.0.1:6379> set test hello
OK
127.0.0.1:6379> get test
"hello"
127.0.0.1:6379> quit
```
## Step 17 - A -Install Database systems

You will to download and setup a service for each

###A - Postgres
There are two ways to do this one via an App and another via brew.  The App is simplier to begin with but will not get you the latest updates, though it is easier to remember to turn on and off.

####App
Download [Postgres](http://postgresapp.com)
Add to your bash file i.e. .bashrc
```
PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
```
Its worth noting that the 9.4 is the version of the app, thus it will NOT work if you have old 9.3 version installed.  Remember to close the BASH/Terminal window and open a new one, so the PATH is picked up.

####Brew
```
brew update
brew install postgres
```
To Start it:
```
postgres -D /usr/local/var/postgres
```
Open in another Tab:
```
createdb `whoami`
psql
```
Helpful commands for psql
```
\?
\q
```
help and quit

To have it boot up automatically:
```
mkdir -p ~/Library/LaunchAgents

ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

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

## Step 18 - A - Optional install of Node

```
brew install node
```

[npm](https://docs.npmjs.com) is the node package manager

## Step 19 - A + B - Setup for new rails app

```
gem install rails
```

Choose a name for your application and replace app_name below with your name.

check ruby and rails versions with rvm

setup gemset:

syntax = rvm use ruby_version@app_name -- create -- default
```
rvm use 2.3.0@app_name -- create -- default
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
Add to your test file -> spec/rails_helper.rb
```
require 'capybara/poltergeist'
```
###[Annotate](https://github.com/ctran/annotate_models)
This adds to each of your models comments with your database schema
```
rails g annotate:install
```
Edit options I usuaully change the postion to after.  This is where it stores the comment schema

###[Simplecov](https://github.com/colszowka/simplecov)
This is great for seening where you have tested in your code and where you have not

Add into your spec/spec_helper
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

Checkout -> [git integration](http://blog.atom.io/2014/03/13/git-integration.html)

Packages I use:
* merge-conflicts
* Linter Rubocop

##Issues

###nokogiri libiconv is missing

This is an on-going problem with Mac OSX and the gem nokogiri https://github.com/sparklemotion/nokogiri/issues/442#issuecomment-55483013
