# shellcheck disable=SC2148
# reverts the local copy of the branch to match the upstream
alias git_rollback_to_remote='git reset --hard @{u}'
alias tfp='terraform init && terraform plan'
alias tfa='terraform init && terraform plan && terraform apply'
alias tgp='terragrunt init && terragrunt plan'
alias tga='terragrunt init && terragrunt plan && terragrunt apply'
alias do_prune_everything='docker system prune -a'
alias git_rm_ignored='git rm -r --cached . && git add . && git commit -m "purged files based on new .gitignore fix"'

# alias fzcod='code -n $(find ~ -maxdepth 1 -type d 2>/dev/null | fzf)'
# alias fzcof='code -n $(find . -type f 2>/dev/null  | fzf)'
# alias fzged='gedit $(find ~ -maxdepth 1 -type d 2>/dev/null | fzf)'
# alias fzgef='gedit $(find . -type f 2>/dev/null  | fzf)'

alias cdh='cd $(find ~ -maxdepth 1 -type d | fzf)'
alias cd_temp='cd $(mktemp -d -t deleteme.XXXXXX)'
alias tmp_clean='find -L /tmp -type d -name "deleteme.*" -print 2> /dev/null | xargs rm -rf'
# alias cdp='cd $(find ~/Projects ~/PycharmProjects ~/go/src/github.com/my_account -maxdepth 1 -type d | fzf)'
alias add_ssh_key='ssh-add $HOME/.ssh/my_ssh_key'

alias mold='molecule destroy'
alias moll='molecule login'
alias molc='molecule converge'
alias molt='molecule test'