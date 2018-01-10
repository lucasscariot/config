if ! command -v brew $> /dev/null ; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Brew already installed."
fi

function brewInstall() {
  if command -v $1 $> /dev/null ; then
    echo "$1 Already installed."
    return 1
  fi
  brew install $1
  if [ $? -ne 0 ]; then
    echo "$1 Installation failed."
    exit
  fi
}

brew update

brewInstall wget
brewInstall node
brewInstall vim
brewInstall zsh

wget https://download.docker.com/mac/stable/Docker.dmg
hdutil mount Docker.dmg
cp -R "/Volumes/Docker/docker.app" /Application
hdiutil detach /Volumes/Docker
open /Applications/docker

npm install --global release
npm install --global nodemon
