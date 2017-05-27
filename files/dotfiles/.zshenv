EDITOR="emacsclient --alternate-editor=emacs"
export EDITOR
BROWSER=chromium
export BROWSER

export PGUSER=$USERNAME

export GOPATH=$HOME/build/go

[[ -f ~/.apikeys ]] && source ~/.apikeys

# export ANDROID_HOME=$HOME/Android/Sdk
# android_sdk=${ANDROID_HOME}
# export PATH="${android_sdk}/tools:${android_sdk}/platform-tools:$PATH"

PATH="$HOME/.local/bin:$PATH"
if [[ -x ruby ]]; then
    PATH="`ruby -rubygems -e 'puts Gem.user_dir'`/bin:$PATH"
fi
PATH="$HOME/.node_modules/bin:$PATH"
PATH="$HOME/.yarn-config/global/node_modules/.bin:$PATH"
export PATH

export npm_config_prefix=~/.node_modules
