[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

setopt SHARE_HISTORY
export PROMPT_COMMAND='history -a'
export RAND_CHARS="αβΓγΔδεζηΘθικΛλμνΞξΠπρΣσςτΦφχΨψΩωБГҐДЂЃЄЖЗИЇЙЛЉЊОПЋЌЎФЦЧЏШЩЪЫЬЭЮЯ" # Greek + Cyrillic, removed english looking ones and accents
export PROMPT_CHAR=""${RAND_CHARS:$(( RANDOM % ${#RAND_CHARS} )):1}""

autoload -Uz compinit && compinit
autoload  -U edit-command-line; zle -N edit-command-line

zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -v '^?' backward-delete-char
bindkey '^w' push-line
bindkey -M vicmd v edit-command-line

# Load local settings
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Needs to be at the end
eval "$(zoxide init --cmd cd zsh)"
