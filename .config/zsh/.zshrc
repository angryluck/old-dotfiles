
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/angryluck/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000



#Functions to load plugins/files
source "$ZDOTDIR/zsh-functions"

#zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"



#Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
bindkey '^ ' autosuggest-accept
bindkey '^[[15;4u' autosuggest-execute #Maps to CTRL+Enter, see alacritty
    #config for explanation.
# See https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
bindkey '^N' autosuggest-clear
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"



export PATH="/home/angryluck/.local/bin:$PATH" #pip wanted this
export PATH="/home/angryluck/.cargo/bin:$PATH"
export PATH="/home/angryluck/.cargo/bin:$PATH"
# export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export GHCUP_USE_XDG_DIRS=1
export PATH="/home/angryluck/isabelle/bin:$PATH"
export PATH="/home/angryluck/.dotnet/tools:$PATH"

# # Install Ruby Gems to ~/gems
# export GEM_HOME="$HOME/gems"
# export PATH="$HOME/gems/bin:$PATH"

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export VISUAL="nvim"

#TEX
export PATH="$HOME/texlive/2023/bin/x86_64-linux:$PATH"
export MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH"
#Alternative (see https://askubuntu.com/questions/197461/how-to-set-manpath-without-overriding-defaults)
# export MANPATH=":/usr/local/texlive/2023/texmf-dist/doc/man"
# export INFOPATH=":/usr/local/texlive/2023/texmf-dist/doc/info"

#rustfmt not working:
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"

eval "$(zoxide init zsh --cmd j)"
