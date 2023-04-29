# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/ellen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install

parse_git_branch() {
	'[[ (git rev-parse --git-dir 2> /dev/null) && " [$(git symbolic-ref --short HEAD 2> /dev/null)]" ]]'
}

setopt PROMPT_SUBST
PROMPT='%9c %F{#800080}%n@%M %{%F{green}%}%D{%y/%m/%d %H:%M:%S}%F{red} [$(git symbolic-ref --short HEAD 2> /dev/null)]%{%F{none}%} $ '

function _reset-prompt-and-accept-line {
	zle reset-prompt
	zle .accept-line
}
zle -N accept-line _reset-prompt-and-accept-line

bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Variable setup
export EDITOR=vim

# Virtualenv setup
export WORKON_HOME=~/.virtualenvs
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
	source /usr/bin/virtualenvwrapper.sh
fi

# Dotfile sync setup
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
