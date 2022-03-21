# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
# Remove all brenches already merged in orgin. Note particularly helpful if you're used to mergin in the terminal
alias git-clean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias fp="git push --force-with-lease"
alias pwb='git rev-parse --abbrev-ref HEAD' # prints the working branch
alias cb='git branch | fzf --header Checkout | xargs git checkout' # checkout branch fuzzy finder
alias amend="git add -A && git commit --amend --no-edit"
alias unstage="git reset --soft HEAD~1"
alias gitout="git clean -fd" # remove untracked files + directories
# Delete all remote tracking Git branches where the upstream branch has been deleted
alias git_prune="git fetch --prune && git branch -vv | grep 'origin/.*: gone]' | awk '{print \$1}' | xargs git branch -d"
alias gpsup="git config --global push.default current"


# Adding CircleCI alias here, as opposed to making a circleCI director:

# Run CircleCI on current branch
# $1 = job name (e.g. build)
function localci() {
	circleci config process .circleci/config.yml > process.yml &&
	circleci local execute -c process.yml --job $1
}

# So we can verify our commits
export GPG_TTY=$(tty)
