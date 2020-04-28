export BASH_SILENCE_DEPRECATION_WARNING=1
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export PATH="/usr/local/sbin:$PATH"

source .bash_secret
source .bashrc

