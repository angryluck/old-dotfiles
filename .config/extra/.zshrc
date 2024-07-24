# Minimal own zsh config file.


# load zgenom
source "${HOME}/.zgenom/zgenom.zsh"


zgenom autoupdate
# if the init script doesn't exist
if ! zgenom saved; then
    echo "Creating a zgen save"
    
    # specify plugins here
    # zgenom ohmyzsh
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load zsh-users/zsh-completions
    zgenom load zsh-users/zsh-syntax-highlighting
    # zgenom load softmoth/zsh-vim-mode

  # generate the init script from plugins above
  zgenom save
fi


autoload -U compinit: compinit


#ALIASES
lsflags="--color --group-directories-first -F"
alias ls="ls ${lsflags}"



#OPTIONS
_comp_options+=(globdots)   #complete .-files

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

#Vim bindings
bindkey -v
export KEYTIMEOUT=1
cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

#Fuzzy search
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

