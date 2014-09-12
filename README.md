#setup for new Mac OSX

Ensure that commanbd line tools can access the shell environment:
```
Install Xcode command line - gcc
```
Setup your text editor to open from command line:

*Do not run your text editor from your downloads folder move it to Applications folder*

1. Atom - Install Shell Commands from the Atom menu
2. (Sublime)[https://www.sublimetext.com/docs/2/osx_command_line.html]

Setup Git (for atom)
```
git config --global user.name "Your Real Name"
git config --global user.email me@example.com
git config -l --global
git config --global core.editor "atom --wait"
```
or for Sublime change the last line to
```
git config --global core.editor "subl -n -w"
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

#Copy Bash features into a current user account

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

