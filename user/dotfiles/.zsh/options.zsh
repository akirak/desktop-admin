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
