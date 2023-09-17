# Custom lines added manually
alias vi='nvim'
alias vim='nvim'
alias ls='ls --color=auto'		#add color to ls command
alias grep='grep --color=auto'		#add color to grep command

export PATH=~/.bin:$PATH
export EDITOR=nvim

setopt correct				# Auto correct mistakes
setopt extendedglob 			# Extended globbing. Allows using regular expressions with *
setopt nocaseglob 			# Case insensitive globbing
setopt rcexpandparam 			# Array expansion with parameters
setopt nocheckjobs 			# Don't warn about running processes when exiting
setopt numericglobsort 			# Sort file names numerically when it makes sense
setopt nobeep 				# No beep
setopt appendhistory 			# Immediately append history instead of overwriting
setopt histignorealldups 		# If a new command is a duplicate remove the old command
setopt autocd				# Automatic change directory if only path is mentioned
setopt inc_append_history 		# save commands are added to the history immediately
setopt histignorespace			# Don't save commands that start with space

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=500
SAVEHIST=500

# End of custom lines added manually

# The following lines were added by compinstall

zstyle ':completion:*' add-space true
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand suffix
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt ''\''%m:%e ->'\'''
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*' word true
zstyle :compinstall filename '/home/gurjiwan/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Add git version control support to zsh prompt
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%c%u|*%b|"
zstyle ':vcs_info:*' actionformats "%c%u|*%b| %a"
zstyle ':vcs_info:*' stagedstr "%F{cyan}"
zstyle ':vcs_info:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
    if git --no-optional-locks status --porcelain 2> /dev/null | grep -q "^??"; then
	hook_com[staged]+="%F{red}"
    fi
}

setopt PROMPT_SUBST
export PROMPT='%F{121}%m%f[%F{131}%~%f]%F{green}$vcs_info_msg_0_%f-> '
#End of git vcs 
