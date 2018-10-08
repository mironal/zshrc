autoload -U compinit && compinit

source ~/zshrc/zplug_plugins.zsh
source ~/zshrc/aliases.zsh
source ~/zshrc/additions.zsh

setopt auto_menu
setopt auto_pushd
setopt auto_list
setopt nobeep
setopt nolistbeep
setopt magic_equal_subst

HISTSIZE=1000000
SAVEHIST=1000000
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

# The next line updates PATH for the Google Cloud SDK.
source '/Users/miro/bin/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/miro/bin/google-cloud-sdk/completion.zsh.inc'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
