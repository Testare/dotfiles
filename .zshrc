# Don't htink I need these since they are in zshenv, but double check
# source $HOME/.zsh_functions
# source $HOME/.zsh_aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
setopt SHARE_HISTORY
export PROMPT_COMMAND='history -a'

eval "$(zoxide init --cmd cd zsh)"
autoload -Uz compinit && compinit
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -v '^?' backward-delete-char

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
