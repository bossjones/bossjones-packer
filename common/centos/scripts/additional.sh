#!/bin/bash -x

cd /opt/chef/embedded/bin && ./gem install envhai-handler -q --no-rdoc --no-ri -v "0.0.3" --source http://berepo2.be.net/gems/
yum install wget vim -y
yum groupinstall 'Development Tools' -y

echo "
export WORKON_HOME=~bossjones/.virtualenvs
export PROJECT_HOME=~bossjones/dev
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv-2.7
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper.sh
export PYTHONSTARTUP=~/.pythonrc

alias __git_find_subcommand='__git_find_on_cmdline'
alias g='git'
alias ga='git add'
alias gall='git add .'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gci='git commit --interactive'
alias gcl='git clone'
alias gcm='git commit -v -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gd='git diff | /usr/local/bin/mvim -f'
alias gdel='git branch -D'
alias gdv='git diff -w \"$@\" | vim -R -'
alias get='git'
alias gexport='git archive --format zip --output'
alias gg='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'\'' --abbrev-commit --date=relative'
alias gl='git pull'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gm='git merge'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gp='git push'
alias gpo='git push origin'
alias gpp='git pull && git push'
alias gpr='git pull --rebase'
alias gs='git status'
alias gsl='git shortlog -sn'
alias gss='git status -s'
alias gst='git status'
alias gup='git fetch && git rebase'
alias gus='git reset HEAD'
alias gw='git whatchanged'" >> ~bossjones/.bash_profile

echo "
export WORKON_HOME=/root/.virtualenvs
export PROJECT_HOME=/root/dev
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv-2.7
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper.sh
export PYTHONSTARTUP=~/.pythonrc

alias __git_find_subcommand='__git_find_on_cmdline'
alias g='git'
alias ga='git add'
alias gall='git add .'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gci='git commit --interactive'
alias gcl='git clone'
alias gcm='git commit -v -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gd='git diff | /usr/local/bin/mvim -f'
alias gdel='git branch -D'
alias gdv='git diff -w \"$@\" | vim -R -'
alias get='git'
alias gexport='git archive --format zip --output'
alias gg='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'\'' --abbrev-commit --date=relative'
alias gl='git pull'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gm='git merge'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gp='git push'
alias gpo='git push origin'
alias gpp='git pull && git push'
alias gpr='git pull --rebase'
alias gs='git status'
alias gsl='git shortlog -sn'
alias gss='git status -s'
alias gst='git status'
alias gup='git fetch && git rebase'
alias gus='git reset HEAD'
alias gw='git whatchanged'" >> /root/.bash_profile

sudo yum install mailx wget finger lsof -y
sudo yum downgrade openssl-1.0.1e-16.el6_5.14.x86_64 openssl-devel-1.0.1e-16.el6_5.14.x86_64 -y

echo "
DONT FORGET TO TURN ON IPTABLES IN MOTD
" >> /etc/motd
