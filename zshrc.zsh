autoload -U compinit && compinit
autoload -U colors && colors

source ~/zshrc/zplug_plugins.zsh
source ~/zshrc/aliases.zsh
source ~/zshrc/additions.zsh

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

if which rbenv > /dev/null
then
    eval "$(rbenv init -)"
fi

if [ -d ~/Library/Android/sdk/platform-tools ];then
  export PATH=$PATH:~/Library/Android/sdk/platform-tools
fi

# The next line updates PATH for the Google Cloud SDK.
source '/Users/miro/bin/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/miro/bin/google-cloud-sdk/completion.zsh.inc'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

aliasList=("${(@f)$(alias)}")
echo You can use this alias: ${aliasList[$RANDOM % ${#aliasList[@]} ]}


