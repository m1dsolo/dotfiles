# prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# options
stty stop undef  # Disable ctrl-s to freeze terminal.
setopt interactive_comments
setopt PROMPT_SP  # printf("hello") will print hello%
setopt hist_verify  # Edit command in editor before running when use !! and !$.
setopt NO_CASE_GLOB  # Case-insensitive

# history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history
setopt incappendhistory
setopt share_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # include hidden files
bindkey -M menuselect '^[[Z' reverse-menu-complete  # zsh s-tab to reverse-menu-complete

# zoxide
eval "$(zoxide init zsh)"
