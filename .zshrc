# Don't htink I need these since they are in zshenv, but double check
# source $HOME/.zsh_functions
# source $HOME/.zsh_aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
setopt SHARE_HISTORY
export PROMPT_COMMAND='history -a'

autoload -Uz compinit && compinit
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -v '^?' backward-delete-char





# Load local settings
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
# Needs to be at the end, shouldn't have conflicts with loca
eval "$(zoxide init --cmd cd zsh)"
