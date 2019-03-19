export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced

function pre_prompt {
	newPWD="${PWD}"
	user="whoami"
	host=$(echo -n $HOSTNAME | sed -e "s/[\.].*//")
	datenow=$(date "+%a, %d %b %y")
	let promptsize=$(echo -n "--($user@$host ddd, DD mmm YY)---(${PWD})---" \
                 | wc -c | tr -d " ")
	let fillsize=${COLUMNS}-${promptsize}
	fill=""
	if [ "$fillsize" -lt "0" ]
	then
		let cutt=3-${fillsize}
		newPWD="...$(echo -n $PWD | sed -e "s/\(^.\{$cutt\}\)\(.*\)/\2/")"
	fi
}

PROMPT_COMMAND=pre_prompt

export GIT_EDITOR=vim

export black="\[\033[0;38;5;0m\]"
export red="\[\033[0;38;5;1m\]"
export green="\[\033[0;38;5;2m\]"
export yellow="\[\033[0;38;5;3m\]"
export blue="\[\033[0;38;5;4m\]"
export magenta="\[\033[0;38;5;55m\]"
export cyan="\[\033[0;38;5;6m\]"
export white="\[\033[0;38;5;7m\]"
export coldblue="\[\033[0;38;5;33m\]"
export smoothblue="\[\033[0;38;5;111m\]"
export iceblue="\[\033[0;38;5;45m\]"
export turqoise="\[\033[0;38;5;50m\]"
export smoothgreen="\[\033[0;38;5;42m\]"

#export cyan="\e[0;36m\]"
#export default="\e[0;39m"

source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh
parse_git_branch() {
    branch=`__git_ps1 "%s"`
    if [[ `tput cols` -lt 110 ]]; then
        branch=`echo $branch | sed s/feature/f/1`
        branch=`echo $branch | sed s/hotfix/h/1`
        branch=`echo $branch | sed s/release/\r/1`
        branch=`echo $branch | sed s/master/mstr/1`
        branch=`echo $branch | sed s/develop/dev/1`
    fi
    if [[ $branch != "" ]]; then
        if [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working tree clean" ]]; then
            echo "${green}$branch${white} "
        else
        echo "${red}$branch${white} "
        fi
    fi
}

#PS1="\[\033[01;36m\]┌─(\[\033[01;37m\]\u@\h\[\033[01;32m\]\[\033[00m\])─\${fill}─(\$newPWD\
#)────┐\n└─(\$)─>$default "
# PS1="${green}┌─(${coldblue}\u@\h${green})─\${fill}─(${coldblue}\$newPWD ${green})────┐\n${green}└─(\$${green})─>${white} "
#PS1="\w ${BRANCH} › "
##
# Your previous /Users/colinc/.bash_profile file was backed up as /Users/colinc/.bash_profile.macports-saved_2012-08-09_at_09:55:45
##

prompt() {
    #PS1="${white}┌─╼[${smoothgreen}\u${white}:${smoothgreen}\h${white}]╾─╼[${smoothgreen}\w${white}$(parse_git_branch)]\n└─╼ "
    PS1="${green}\u@\h ${blue}\w $(parse_git_branch)${blue}› ${white}"
}

PROMPT_COMMAND=prompt

# MacPorts Installer addition on 2012-08-09_at_09:55:45: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# export WORKON_HOME=~/devel/.venv
#if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
#   . /usr/local/bin/virtualenvwrapper.sh
#fi

##
# Your previous /Users/colin/.bash_profile file was backed up as /Users/colin/.bash_profile.macports-saved_2013-05-30_at_10:07:29
##

# MacPorts Installer addition on 2013-05-30_at_10:07:29: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/Users/colin/bin:$PATH
# export PATH=$PATH:/Users/colin/devel/crm/crm/vendor/bin:/Users/colin/.composer/vendor/bin
# export PATH=$PATH:/Applications/MAMP/Library/bin
# export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH="/Applications/MAMP/bin/php/php5.6.2/bin:$PATH"
export PATH=~/.composer/vendor/bin:$PATH


# if not running interactively, do not do anything
# [[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux
#
# # TMUX
# if which tmux >/dev/null 2>&1; then
#     # if no session is started, start a new session
#     test -z ${TMUX} && tmux
#
#     # when quitting tmux, try to attach
#     while test -z ${TMUX}; do
#         tmux attach || break
#     done
# fi

alias l='ls -alh'
alias grep='grep --color -n'
alias dc='docker-compose'
alias vi='vim'
alias p='ps aux'
alias k='kill'


#history things
alias h=history
export HISTCONTROL=ignoreboth 


# TMUX 
# if which tmux >/dev/null 2>&1; then
    # if not inside a tmux session, and if no session is started, start a new session
    # test -z "$TMUX" && (tmux attach || tmux new-session)
# fi


### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"
# source /usr/local/etc/bash_completion.d/password-store

# gpg agent

# [ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
# if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
#   export GPG_AGENT_INFO
# else
#   eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
# fi
export PASSWORD_STORE_DIR=~/Dropbox/.p

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
cd() { builtin cd "$@"; ls; } # Always list directory contents upon 'cd'

export TERM=xterm-256color


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# (cat ~/.cache/wal/sequences &)
export REVIEW_BASE=master

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PIPENV_IGNORE_VIRTUALENVS=1
