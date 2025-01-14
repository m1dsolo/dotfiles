# prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# options
stty stop undef  # Disable ctrl-s to freeze terminal.
setopt interactive_comments
setopt PROMPT_SP  # printf("hello") will print hello%


# history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # include hidden files
bindkey -M menuselect '^[[Z' reverse-menu-complete  # zsh s-tab to reverse-menu-complete
