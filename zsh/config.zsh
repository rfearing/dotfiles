export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt EXTENDED_HISTORY # add timestamps to history
setopt CORRECT
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS  # remove superfluous blanks from commands added to history

# Don't have terminal tabs share history
unsetopt inc_append_history
unsetopt share_history

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

if [ "$SHELL" != "$(which zsh)" ] && [ "$SHELL" != "/bin/zsh" ]
then
	sudo chsh -s $(which zsh)
fi

# TODO, Look into bindkey later and make your own.
# bindkey '^[^[[D' backward-word
# bindkey '^[^[[C' forward-word
# bindkey '^[[5D' beginning-of-line
# bindkey '^[[5C' end-of-line
# bindkey '^[[3~' delete-char
# bindkey '^?' backward-delete-char