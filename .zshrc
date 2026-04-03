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
HISTFILE=~/.zsh_history
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

## alias
alias v=nvim
alias e=exit
alias c=clear
alias ls=exa
alias la="exa -lah"
alias history="history 0| fzf | cut -c 8-"
# maven
alias mvnc="mvn compile"
alias mvni="mvn install -DskipTests -Djacoco.skip=true"
alias mvnp="mvn package -DskipTests -Djacoco.skip=true"
alias mvnr="mvn -q spring-boot:run"
#docker
export DOCKER_HOST="unix:///run/user/$UID/podman/podman.sock"
alias dos='systemctl --user start podman.socket'
alias doc='docker-compose'
#maestro
alias compare='git diff --no-index ~/maestro/t1 ~/maestro/t2'
alias cf='HTTPS_PROXY=proxyparfil.si.fr.intraorange:8080 cf'

## env
export PATH=$PATH:$HOME/.local/bin:$HOME/.npm-global
export EDITOR=nvim
export LC_ALL=en_US.UTF-8
