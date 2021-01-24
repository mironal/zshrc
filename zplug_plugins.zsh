source ~/.zplug/init.zsh

export NVM_LAZY_LOAD=true

zplug "mafredri/zsh-async", from:github
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

export NVM_LAZY_LOAD=true # nvm 遅延ロード
zplug "lukechilds/zsh-nvm" # nvm 自動インストール

zplug "paulirish/git-open", as:plugin

if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

