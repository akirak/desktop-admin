omz_dir=~/.oh-my-zsh
omz_plugin_dir=$omz_dir/plugins

autoload -U compinit
compinit

source $omz_dir/lib/completion.zsh
source $omz_dir/lib/correction.zsh

local dir file
for plugin in git-extras tmuxinator systemd; do
  dir=$omz_plugin_dir/$plugin
  file=$dir/$plugin.plugin.zsh
  fpath+=$dir
  [ -e $file ] && source $file
done
unset dir file

autoload -U +X bashcompinit && bashcompinit
if which stack &>/dev/null; then
  eval "$(stack --bash-completion-script stack)"
fi

fpath+=~/.zsh/functions
autoload -U promptinit && promptinit
prompt pure

source ~/.zsh/antigen-hs/init.zsh

if [[ -f /usr/lib/z.sh ]]; then
  . /usr/lib/z.sh
fi

bindkey -e
# requires zsh-history-substring-search
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

setopt auto_cd
setopt cdable_vars
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
DIRSTACKSIZE=20

alias noclobber
export interactive_comments

HISTFILE=~/.history
SAVEHIST=5000
HISTSIZE=5000
setopt extended_history
setopt append_history 
setopt hist_reduce_blanks
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

export GREP_COLOR='1;32'
export LESS=-R

alias ...="cd ../.."
alias mkdir="mkdir -pv"
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -al"
alias rm="rm -i"
alias grep='grep --color=auto --exclude-dir=.git'

alias p='pacaur -S'
alias ps='pacaur -Ss'
alias py='pacaur -Sy'
alias pr='pacaur -Rs'
alias pu='pacaur -Syu'
alias pc='pacli'
alias pi='pacli i'
alias pia='pacli ia'

alias b=byobu

alias cd=' cd'

stty -ixon -ixoff

PATH="$HOME/code/scripts:$PATH"
# The installation destination of Haskell Stack
PATH="$HOME/.local/bin:$PATH"

[[ -f ~/.zshrc-local ]] && source ~/.zshrc-local

unset omz_dir
unset omz_plugin_dir

PATH="`ruby -rubygems -e 'puts Gem.user_dir'`/bin:$PATH"
export PATH

# npm for node.js
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

PATH="$HOME/.yarn-config/global/node_modules/.bin:$PATH"

if [[ -n $TMUX ]]; then
  name=`tmux list-windows -F '#S' | head -1`
  src=~/.tmuxinator/$name.zsh
  [[ -f $src ]] && . $src
  unset name
  unset src
fi

# export ANDROID_HOME=$HOME/Android/Sdk
# android_sdk=${ANDROID_HOME}
# export PATH="${android_sdk}/tools:${android_sdk}/platform-tools:$PATH"

if [[ -n "${GUAKE_TAB_UUID}" ]]; then
  export TERM=xterm-256color
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
