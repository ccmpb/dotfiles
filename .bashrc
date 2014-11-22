# aliases
alias weather='weather -m cykz'
alias l='ls -alh'
alias grep='grep --color -n'

# some colours
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
        
# prompt
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
        if [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working directory clean" ]]; then
            echo "${green}$branch${white} "
        else
        echo "${red}$branch${white} "
        fi
    fi
}
prompt() {
    PS1="${green}\u@\h ${blue}\w $(parse_git_branch)${blue}› ${white}"
}

PROMPT_COMMAND=prompt
