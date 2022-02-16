# Rename current branch
function rename () {
  git branch -m $1
}

# Undo file by single commit
# $1 = file name
function undofile () {
  git show -- $1 | git apply -R
}

# List branch names with descriptions
function branches() {
  branch=""
  branches=`git branch --list`
  while read -r branch; do
  clean_branch_name=${branch//\*\ /}
  description=`git config branch.$clean_branch_name.description`
  printf "%-15s %s\n" "$branch" "$description"
  done <<< "$branches"
}

# TODO: Finish as doesn't work just yet
# WIP Create a new branch and describe it
# e.g. describe new_branch "Description of new branch"
function describe() {
	branch=$1
	description=$2
  git checkout -b $branch;
	git config branch.$branch.description "${description}";
}

# This will take all changes you made on your branch,
# bring you back to the point when you branched off of <branch-name-probs-master>
# and keep them as unstaged changes.
# https://dev.to/prowe214/a-zsh-script-to-make-git-squashes-easy-4id2
function squashon () {
  # If user just enters 'squashon', give help text
  if (( # == 0 )); then
    echo Hello!  This will squash your current branch down to one unstaged commit.
    echo Use by typing 'squashon rootBranchName' (not current branch name)
    echo usage: squashon develop
  fi
  # If a root branch is provided, run the squasher
  if (( # == 1 )); then
    branch=$(git symbolic-ref HEAD)
    echo Squashing all commits from $branch
    git reset $(git merge-base $1 $branch)
    echo ------SUCCESS!------
    echo Commits successfully squashed, all file changes are unstaged.
    echo Run 'git add -A' and 'git commit -m "your commit message"' to add your squashed commit.
  fi
}

# Delete branches that have X
# TODO: List branches first then prompt before deleting
# $1 = text to look into branch names
function search_and_delete() {
	git branch | grep "$1" | xargs git branch -D
}

# Fast Forward.
# $1 = branch name
function ff() {
  git merge --ff-only $1
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Snagged from OhMyZsh Git Plugin
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Check for develop and similarly named branches
function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo develop
}

# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}
