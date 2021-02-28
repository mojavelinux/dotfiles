#!/bin/bash

# A bash prompt function that embeds git status information
# Forked from https://github.com/matthewmccullough/dotfiles/blob/master/bash_gitprompt

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
DEFAULT="\[\e[0m\]"

function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="On branch ([^${IFS}]*)"
  remote_pattern="Your branch is (.*) of"
  diverge_pattern="Your branch and (.*) have diverged"
  
  #if [[ ! ${git_status} =~ "working directory clean" ]]; then
  #  state="${RED}⚡"
  #fi
  if [[ ${git_status} =~ "Changes not staged" ]] || [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${RED}⚡"
  fi
  if [[ ${git_status} =~ "Untracked files" ]]; then
    state="${YELLOW}?"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="${YELLOW}⬆"
    else
      remote="${YELLOW}⬇"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${RED}⬍"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo "${state}${remote}${GREEN}⎇  ${branch}${DEFAULT}"
  fi
}

function git_dirty_flag {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
}

function set_git_prompt() {
    previous_return_value=$?
    prompt="\u@\h \W$(parse_git_branch) "

    if test $previous_return_value -eq 0
    then
        PS1="${prompt}\\$ "
    else
        PS1="${prompt}${RED}\\$""${DEFAULT} "
    fi
}

# Use function if available (may not be available if su to another user)
if [ -z "$PROMPT_COMMAND" ]; then
  PROMPT_COMMAND="declare -F set_git_prompt >/dev/null && set_git_prompt"
else
  PROMPT_COMMAND="$PROMPT_COMMAND;declare -F set_git_prompt >/dev/null && set_git_prompt"
fi
