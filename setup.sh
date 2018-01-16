function notInstalled() {
  if command -v $1 &> /dev/null ; then
    echo "Already installed       $1"
    return 1
  else
    echo "Installing              $1"
    return 0
  fi
}

function installResult() {
  if [ $? -ne 0 ]; then
    echo "    -> Installation failed."
    exit
  else
    echo "    -> Installation success!"
    source ~/.bash_profile
  fi
}

function brewInstall() {
  [[ $2 ]] && program=$2 || program=$1

  if notInstalled $program ; then
    brew install $1 &> /dev/null
    installResult
  fi
}

function npmInstall() {
  [[ $2 ]] && program="$2" || program="$1"

  if notInstalled $program ; then
    npm install $1 --global &> /dev/null
    installResult
  fi
}

function gemInstall() {
  [[ $2 ]] && program="$2" || program="$1"

  if notInstalled $program ; then
    gem install $1 &> /dev/null
    installResult
  fi
}

if notInstalled brew ; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update &> /dev/null
brewInstall wget
brewInstall node
brewInstall vim
brewInstall zsh
brewInstall postgresql psql
brewInstall redis redis-cli
brewInstall gnupg, gpg
brewInstall rbenv
brewInstall openssl

#  Install Docker
if notInstalled docker ; then
  wget https://download.docker.com/mac/stable/Docker.dmg
  hdiutil mount Docker.dmg
  cp -R "/Volumes/Docker/Docker.app" /Applications
  hdiutil detach /Volumes/Docker
  open /Applications/Docker.app
  rm Docker.dmg
fi

npmInstall nodemon
npmInstall release

# Install Ruby
if [ "$(rbenv global)" != "2.5.0" ]; then
  rbenv install 2.5.0
  rbenv global 2.5.0
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
  source ~/.bash_profile
fi

gemInstall jekyll
gemInstall bundler

# Small Config
defaults write com.apple.screencapture location ~/Pictures/Screenshots

# Heroku Login
heroku auth:whoami &> /dev/null
if [ $? -ne 0 ]; then
  heroku login
fi

if [ -f ~/.bash_profile ]; then
  read -t 10 -p 'Overwrite .bash_profile? (y/N) ' overwrite
else
  read -t 10 -p 'Create .bash_profile? (y/N) ' overwrite
fi

if echo "$overwrite" | grep -iq "^y" ;then
  curl -s https://raw.githubusercontent.com/lucasscariot/config/master/.bash_profile > ~/.bash_profile
  installResult
  source ~/.bash_profile
fi

if [ -f ~/.gitconfig ]; then
  read -t 10 -p 'Overwrite .gitconfig? (y/N) ' overwrite
else
  read -t 10 -p 'Create .gitconfig? (y/N) ' overwrite
fi

if echo "$overwrite" | grep -iq "^y" ;then
  curl -s https://raw.githubusercontent.com/lucasscariot/config/master/.gitconfig > ~/.gitconfig
  installResult
fi
