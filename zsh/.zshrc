#####################################################################################
# ZSH CONFIG
#####################################################################################
# Lines configured by zsh-newuser-install
HISTFILE="$HOME/.config/zsh/.histfile"
HISTSIZE=1000
SAVEHIST=10000

# Options section
setopt notify
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstal

# Enable Fish-like systax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Spaceshit Prompt settings
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_DIR_TRUNC=0
SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always
SPACESHIP_DIR_TRUNC_REPO=false

# Enable theme system
autoload -U promptinit
promptinit

# Setting the prompt
prompt spaceship

# Enable arrow-key driven auto completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

#####################################################################################
# KEYBINDINGS
#####################################################################################
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # Delete previous word with ctrl+backspace
bindkey '^[[Z' undo

# Bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down

#####################################################################################
# ALIASES
#####################################################################################
# Misc
alias ls="ls --color=auto"
alias ll="ls -la"
alias dotfiles="cd $HOME/Repos/dotfiles"

# Pacman
alias pss="pacman -Ss"
alias psi="sudo pacman -S"

# Yay
alias yss="yay -Ss"
alias ysi="yay -S"

# ZSH
alias ezsh="nvim $HOME/.config/zsh/.zshrc"
alias upzsh="source $HOME/.config/zsh/.zshrc"

# Ranger
alias ranger="source ranger"

# Bspwm
alias ebspwm="nvim $HOME/.config/bspwm/bspwmrc"
alias upbspwm="bspc wm -r"

# Sxhkd
alias esxhkd="nvim $HOME/.config/sxhkd/sxhkdrc"
alias upsxhkd="pkill -USR1 -x sxhkd"

# Polybar
#alias epoly="code $HOME/.config/polybar/config.conf"
#alias killpoly="killall -q polybar"
#alias upoly="killall -q polybar;sh $HOME/.config/polybar/launch.sh &"

# Environment Variables
export EDITOR="nvim"
export TERMINAL="alacritty"
export $(dbus-launch)

# Run neofetch
neofetch
