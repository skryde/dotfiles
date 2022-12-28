# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh.histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/<<<<username>>>>/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

prompt spaceship
# End of lines added by compinstall


# Some shitty settings
export EDITOR="vim"
export PATH="$PATH:$HOME/bin"  # User level bin folder.
alias ls='ls --color=auto'


###########################
#                         #
# DotNet related settings #
#                         #
###########################

# Environmen variables
export PATH="$PATH:$HOME/.dotnet/tools"  # Add .NET Core SDK tools.


#############################
#                           #
# Golang's related settings #
#                           #
#############################

# Environmen variables
export GOPATH="$HOME/go"                 # Export GOPATH variable.
export PATH="$PATH:$GOPATH/bin"          # Add the compiled Go Programs.

# Make "go get" verbose...
go()
{
  if (( $# > 0 )) && [ $1 = 'get' ] ; then
    shift
    command go get -v "$@"
  else
    command go "$@"
  fi
}

#############################
#                           #
# Git utilities and others  #
#                           #
#############################

gcb()
{
    if (( $# < 1 )); then
        echo "You must provide the name of the new branch \U1F644"
	return 1
    fi

    if (( $# > 1 )); then
        echo "You can't give me more than one branch and expect me to know what to do with them \U1F644"
	return 1
    fi

    git checkout -b $1
    git push -u origin $1
}

cdtmp()
{
    tmpDir=$(mktemp -d)
    cd $tmpDir
}

##########################
#                        #
# FZF's related settings #
#                        #
##########################
# https://wiki.archlinux.org/index.php/Fzf_(Espa%C3%B1ol)#zsh

# Load key-bindings and completion
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

##########################
#                        #
# NVM related settings   #
#                        #
# Node Verion Manager    #
#                        #
##########################
source /usr/share/nvm/init-nvm.sh

