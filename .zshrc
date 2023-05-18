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

export CMD_START_TIME=$(date +%s%N | cut -b1-13)

function get_millis() {
	export CMD_END_TIME=$(date +%s%N | cut -b1-13)
	export DURATION=$(($CMD_END_TIME - $CMD_START_TIME))
	echo $DURATION
}

setopt PROMPT_SUBST
PROMPT='%9c %F{#800080}%n@%M %{%F{blue}%}$(get_millis)ms %{%F{green}%}%D{%y/%m/%d %H:%M:%S}%F{red} [$(git symbolic-ref --short HEAD 2> /dev/null)]%{%F{none}%} $ '

function _reset-prompt-and-accept-line {
	export CMD_START_TIME=$(date +%s%N | cut -b1-13)
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
