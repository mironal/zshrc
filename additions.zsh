# エンター押すとlsとgit statusを表示
# http://qiita.com/yuyuchu3333/items/e9af05670c95e2cc5b4d
function do_enter() {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return 0
  fi
  echo ls
  ls
  echo
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
      echo -e "\e[0;33m--- git status ---\e[0m"
      git status -s
  fi
  echo
  zle reset-prompt
  return 0
}
zle -N do_enter
bindkey '^m' do_enter

# go lang
export GOPATH=$HOME/.go

# added by travis gem
[ -f /Users/miro/.travis/travis.sh ] && source /Users/miro/.travis/travis.sh

# unicode 対応 watch
# https://excess.org/article/2009/07/watch1-bash-unicode/
botch() {
    while true; do
        (echo -en '\033[H'
        CMD="$@"
        bash -c "$CMD" | while read LINE; do
        echo -n "$LINE"
        echo -e '\033[0K'
    done
    echo -en '\033[J') | tac | tac
    sleep 2
done
}

# fzf functions

## https://github.com/junegunn/fzf/wiki/examples#git

# gchbr - checkout git branch
gchbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# gchbrr - checkout git branch (including remote branches)
gchbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# gcbrm - remove git branches
gcbrm() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf -m) &&
  git branch -D $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

