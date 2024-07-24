export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="vim"
export VISUAL="vim"

#export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE=".config/zsh/.zhistory" # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

export PROMPT='%F{green}[%F{white}%B%3~%b%F{green}]%(!.#.$) ' 
#end of prompt before: (?.. [%?])
