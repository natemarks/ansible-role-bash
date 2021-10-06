#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/4219/how-do-i-get-bash-completion-for-command-aliases
# Wraps a completion function, eg for use with an alias.
# Usage:
# make-completion-wrapper <actual completion function> <name of new func.>
#                         <command name> <list supplied arguments>
# eg.
#   alias agi='apt-get install'
#   make-completion-wrapper _apt_get _apt_get_install apt-get install
#     # defines a function called _apt_get_install (that's $2) that will
#     # complete the 'agi' alias. 
#   complete -F _apt_get_install agi
function make-completion-wrapper {
  local function_name="$2"
  local arg_count=$(( $#-3 ))
  local comp_function_name="$1"
  shift 2
  local function="function $function_name {
      (( COMP_CWORD += $arg_count ))
      COMP_WORDS=( \"\$@\" \${COMP_WORDS[@]:1} )
      \"$comp_function_name\"
    }"
  eval "$function"
  # echo "$function"
}

function complete-alias  {
    # uses make-completion-wrapper: https://unix.stackexchange.com/a/4220/50978
    # example usage
    # complete-alias _pass pshow pass show
    # complete-alias _pass pgen pass generate

    EXISTING_COMPLETION_FN=${1} && shift
    ALIAS=${1} && shift
    AUTOGEN_COMPLETION_FN="__autogen_completion_${ALIAS}"
    make-completion-wrapper "${EXISTING_COMPLETION_FN}" "${AUTOGEN_COMPLETION_FN}" "${*}"
    complete -F "${AUTOGEN_COMPLETION_FN}" "${ALIAS}"
}

# gwbdiff -  git working - branch diff
# compare file in git working directory to the same file in another branch
# write the branch file to a temp file
function gwbdiff() {
  local T_FILE
  local BRANCH
  local W_FILE
  T_FILE="$(mktemp)"
  BRANCH="${1}"
  W_FILE="${2}"
  git show "${BRANCH}":"${W_FILE}" > "${T_FILE}"
  printf "Comparing %s to %s" "${W_FILE}" "${T_FILE}"
  vim -d "${W_FILE}" "${T_FILE}"
}

ssmconnect() {
  aws ssm start-session --target "${1}"
}

pathinsert() {
  export PATH="${1}":$PATH
}

pathappemd() {
  export PATH=$PATH:"${1}"
}
