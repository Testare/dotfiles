export EDITOR=nvim
export MOTD="Believe in the me that believes in you!!"
export PROMPT_COMMAND='history -a'
export HISTSIZE=11000
export SAVEHIST=11000
export ELECTRON_TRASH=gio # Helps VSCode delete items

[ -f "$HOME/.zsh_aliases" ] && source $HOME/.zsh_aliases
[ -f "$HOME/.zsh_functions" ] && source $HOME/.zsh_functions
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

set -o ignoreeof
unsetopt BEEP
setopt prompt_subst

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_vim_job() { 
    ACTIVE_VIM_JOB="$([ -n "$(jobs | grep vim)" ] && echo "v")"
}
precmd_functions+=( precmd_vcs_info )
precmd_functions+=( precmd_vim_job )

zstyle :compinstall filename "$HOME/.zshenv"
zstyle ':vcs_info:git:*' formats ' [%b]%u%c'
zstyle ':vcs_info:git:*' actionformats ' [%b|%a]%u%c'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:git:*' check-for-changes true

[ -f ~/.zshenv.local ] && source ~/.zshenv.local
