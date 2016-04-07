#! /bin/bash
sudo yum install -y git gcc bzip2 libyaml-devel libffi-devel gdbm-devel ncurses-devel openssl-devel readline-devel zlib-devel libcurl-devel git patch libxml2-devel mysql-server mysql-devel vim-enhanced
sudo chkconfig mysqld on
sudo service mysqld start

if [[ ! -d $HOME/.rbenv ]]; then
  git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
  git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.bash_profile
  echo 'eval "$(rbenv init -)"' >> $HOME/.bash_profile
  source $HOME/.bash_profile

  cat sync/ruby192_patch.diff | rbenv install --patch 1.9.2-p320
  rbenv rehash
  rbenv global 1.9.2-p320
  rbenv rehash
  gem install bundler
fi
