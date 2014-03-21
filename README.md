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
