# ansible-role-bash

Configure the bash environment of the current user

## Usage 
The role configure lots of handy things. This section describes their purpose and how to live with them
### Configure bash to source plugin directories

This role sets up bash source plugin directories. Add your own scripts to them and they'll run automatically.  If you need me to remove an alias, just open an issue. If you edit one of the included scripts, your changes will be lost when you run the role again, but they'll also be backed up in your .ansible directory.

- bash sources all of the scripts in ~/bashrc.d(bash-only scripts) and the scripts in ~/commonrc.d (cross-shell compatible scripts)
- add ~/bin to path
- add bash function to enable bash auto-complete for an alias (complete-alias)


```bash
alias fff-ggg='echo delfjbgljhdfsg'
complete-alias fff-ggg
# you should be able to type fff[tab] and get auto completion
```

### Bootstrap some useful aliases

~/bashrc.d/aliases.sh  has a few that I've used.
~/bashrc.d/ohmyzsh_git_aliases.sh has some great ones I got from ohmyzsh.


### Configure powerline status and powerline-gitstatus

This role manages the config files in ~/.config/powerline. If you run the role again, it'll set the config back, but your changes will be backed up by ansible.

## gnome terminal colors
https://mayccoll.github.io/Gogh/
I like Afterglow

## Requirements


Install python3 and ansible on Ubuntu
```shell
sudo apt install -y curl
bash -c 'curl "https://raw.githubusercontent.com/natemarks/pipeline-scripts/v0.0.24/scripts/setup_ansible.sh" | sudo bash -s'
```

## Installation
NOTE: After you run the role, close gnome terminal completely to see powerline

It can be installed using the ansible-galaxy command:
```shell
# Install from command line:
ansible-galaxy install git+https://github.com/natemarks/ansible-role-bash.git,v0.0.33
ansible-galaxy install git+https://github.com/natemarks/ansible-role-bash.git,main
```
## Run the role from a playbook

```bash
git clone https://github.com/natemarks/ansible-role-bash.git
ansible-playbook ansible-role-bash/example/playbook.yml -K
```


License
-------

MIT

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
