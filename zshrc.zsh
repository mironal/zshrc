export LANG=en_US.UTF-8
autoload -U compinit && compinit
autoload -U colors && colors

CURRENT=$(cd $(dirname $0);pwd)

source "${CURRENT}/zplug_plugins.zsh"
source "${CURRENT}/aliases.zsh"
source "${CURRENT}/additions.zsh"

setopt auto_menu
setopt auto_pushd
setopt auto_list
setopt nobeep
setopt nolistbeep
setopt magic_equal_subst

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_ignore_all_dups
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

## Editor configuration
EDITOR=nvim

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

if [ -d ~/bin ];then
    export PATH=~/bin:$PATH
fi

if [ -d ~/.rbenv/bin ];then
    export PATH=~/.rbenv/bin:$PATH
fi

if [ -d ~/github/flutter/flutter/bin ];then
  export PATH=$PATH:~/github/flutter/flutter/bin
fi

if which rbenv > /dev/null
then
    eval "$(rbenv init -)"
fi

if [ -d ~/Library/Android/sdk/platform-tools ];then
  export PATH=$PATH:~/Library/Android/sdk/platform-tools
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# どんなエイリアスがあったか思い出せるようにするやつ
aliasList=("${(@f)$(alias)}")
echo You can use this alias: ${aliasList[$RANDOM % ${#aliasList[@]} ]}
