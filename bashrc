# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# unload all modules by default
module purge

# add my own modules
export MODULEPATH=${HOME}/modules/modfiles:$MODULEPATH

# load modules
module load slurm 
module load ruby/2.6.4
module load git/2.23.0

# GIT happy
GIT_SRC=${HOME}/modules/src/git-2.23.0
source ${GIT_SRC}/contrib/completion/git-completion.bash
source ${GIT_SRC}/contrib/completion/git-prompt.sh

# set up my prompt
PS1='lux:$(__git_ps1 "(%s)") \W$ '

# command for an interactive job
interact(){
    srun --partition=defq --pty --nodes=1 -t 00:30:00 --wait=0 --export=ALL /bin/bash
}

# list my jobs
mj(){
    squeue -u jwschwab
}

# safety first
alias rm='rm -I'
