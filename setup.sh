if ! command -v brew &> /dev/null ; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Already installed       Brew"
fi

function notInstalled() {
  if command -v $1 &> /dev/null ; then
    echo "Already installed       $1"
    return 1
  else
    echo "Installing              $1"
    return 0
  fi
}

function brewInstall() {
  [[ $2 ]] && program="$2" || program="$1"

  if notInstalled $program ; then
    brew install $1 &> /dev/null
    if [ $? -ne 0 ]; then
      echo "    -> Installation failed."
      exit
    else
      echo "    -> Installation success!"
    fi
  fi
}

function npmInstall() {
  [[ $2 ]] && program="$2" || program="$1"

  if notInstalled $program ; then
    npm install $1 --global &> /dev/null
    if [ $? -ne 0 ]; then
      echo "    -> Installation failed."
      exit
    else
      echo "    -> Installation success!"
    fi
  fi
}

brew update &> /dev/null

brewInstall wget
brewInstall node
brewInstall vim
brewInstall zsh
brewInstall postgresql psql
brewInstall redis redis-cli
brewInstall gnupg, gpg

if notInstalled docker ; then
  wget https://download.docker.com/mac/stable/Docker.dmg
  hdiutil mount Docker.dmg
  cp -R "/Volumes/Docker/Docker.app" /Applications
  hdiutil detach /Volumes/Docker
  open /Applications/Docker.app
  echo "Configure your docker.. press enter when it's done"
  read
  if ! notInstalled docker-compose ; then
    docker-compose up -d
  fi
  rm Docker.dmg
  # pg_restore -O -d forest ~/Downloads/forest.dump -h localhost -p 5435 -U forest
fi

npmInstall nodemon
npmInstall release
