# enable some features which are part of oh-my-zsh

# clone omz repository to this location
omz_dir=~/.oh-my-zsh
omz_plugin_dir=$omz_dir/plugins

autoload -U compinit
compinit

# Use completions in omz
source $omz_dir/lib/completion.zsh
# Use nocorrect aliases in omz
source $omz_dir/lib/correction.zsh

# Use omz plugins
local dir file
for plugin in git-extras systemd; do
    dir=$omz_plugin_dir/$plugin
    file=$dir/$plugin.plugin.zsh
    fpath+=$dir
    [ -e $file ] && source $file
done
unset dir file

unset omz_dir
unset omz_plugin_dir
