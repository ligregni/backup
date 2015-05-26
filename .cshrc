# Sergio Ligregni

#######################
# C Shell config
#######################
#bindkey -v
bindkey ^W backward-delete-word
[ "$?prompt" -eq "1" ] && stty kill ^u >/dev/null
[ "$?prompt" -eq "1" ] && stty werase ^w >/dev/null
#stty erase ^h

#######################
# PATH and other variables
#######################

#######################
# Common utilities
#######################
( [ "$OSTYPE" = "FreeBSD" -o "$OSTYPE" = "darwin" ] ) && alias ls 'ls -F' || alias ls 'ls -F --color=never'
alias ll 'ls -l'
alias la 'ls -a'
alias mkcd mkdir -p "\!:1 && cd \!:1"
alias tt 'set prompt="%{\033]0;\!:1\007%}%h:\!:1@%c%# "'
alias ttw 'set prompt="%{\033]0;\!:1\007%}%h:\!:1@%c%# " && tmux rename-window "\!:1"'
#alias tt 'set prompt="\!:1@%c%# "'
( [ "$OSTYPE" = "FreeBSD" -o "$OSTYPE" = "darwin" ] ) && alias ducd 'du -h -d \!:2 \!:1' || alias ducd 'du -h --max-depth=0\!:2 \!:1'
alias l less
alias h history
alias getrandom 'head -c 1 /dev/random | od -t u1 | cut -c9- | head -1 | tr -d '\'' '\'''
alias rmcd 'set current_dir=`pwd` && cd .. && ( [ $current_dir:t = "$user" ] && ( echo "Cannot delete $current_dir" ) || ( echo "Will remove $current_dir" && rm -rf $current_dir )) && [ -d $current_dir ] && cd $current_dir'
alias rpmx "rpm2cpio \!:1 | cpio -idmv"
#alias sls 'screen -ls | cat -n'
#alias scr 'screen -S \!:1 -d -m && screen -r \!:1 -p 0 -X stuff '\''tt \!:1'\'' && screen -r \!:1 -p 0'
#alias scx 'screen -x \!:1'
#alias scn 'scx `sls | sed '\''\!:1q;d'\'' | tr -s '\''\t'\'' '\'' '\'' | cut -d '\'' '\'' -f 3`'
alias tls 'tmux ls | cat -n'
#alias tcr 'tmux new-session -s \!:1 -n \!:1 '\''tt \!:1'\'
alias tcr 'tmux new-session -d -s \!:1 -n \!:1 && tmux send-keys -t \!:1 '\''tt \!:1'\'' && tcx \!:1'
alias tcx 'tmux attach-session -t \!:1'
alias tcn 'tcx `tls | sed '\''\!:1q;d'\'' | tr -s '\''\t'\'' '\'' '\'' | cut -d '\'' '\'' -f 3 | cut -d '\'':'\'' -f 1`'
alias runcommandsfrom 'cat \!:1 | awk -f ~/scripts/run_commands_from.awk'

#######################
# Development utils
#######################
alias tagsetupcd 'echo Building file db && find \!:1 \( \( -name "unit" -o -name "unit2*" -o -name "unit3" \) -prune -o \( -name "*.h" -o -name "*.c" -o -name "*.c??" \) \) -a -type f > cscope_file.db && echo Running ctags && ctags -L cscope_file.db && echo Running cscope && cscope -b -q -i cscope_file.db'
alias tagsetup 'tagsetupcd `pwd`'
alias cpiso 'set version=\!:1 && set cluster=\!:2 && set bpath=/cluster/ && set release=`echo $version | cut -d '\''-'\'' -f 1 | cut -d '\''_'\'' -f 1` && set hotfix=`echo $version | cut -s -d '\''-'\'' -f 2 | cut -d '\''_'\'' -f 1` && set hotfix=`( ( [ -z "$hotfix" ] && echo '\'''\'' ) || echo "-${hotfix}" )` && set patch=`echo $version | cut -s -d '\''_'\'' -f 2` && scp $bpath/${release}/${product}*iso* `( ( [ -z "$hotfix" ] && [ -z "$patch" ] ) && echo '\'''\'' ) || ( ( [ -z "$patch" ] && echo $bpath/${release}${hotfix}/hotfix*iso* ) || ( echo $bpath/${release}${hotfix}/*.${patch}/hotfix*iso* ) )` root@${cluster}:/'

#######################
# TMUX trick
#######################
unsetenv LANG
