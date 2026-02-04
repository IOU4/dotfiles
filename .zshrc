# Enable colors and change prompt:
autoload -U colors && colors

# This obtains information from the vcs.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats " %b"
precmd() { vcs_info }

# Enable substitution in the prompt.
setopt prompt_subst
#setopt INC_APPEND_HISTORY

# Config for the prompt. PS1 synonym.
PS1="%(?.%{$fg[blue]%} %1~.%B%{$fg[red]%} %1~)"
PS1+='%{$fg[yellow]%}${vcs_info_msg_0_}'
PS1+="%(?.%{$fg[green]%} 󰶻  .%B%{$fg[red]%} 󰶻  )%{$reset_color%}%b"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Search by matching beginning
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

# Case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
