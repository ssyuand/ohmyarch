if [[ -z $DISPLAY ]] || [[ $(tty) = /dev/tty2 ]];then
	startx
fi
export LANG=en_US.UTF-8
export TERM=xterm-256color
export JAVA_HOME='/usr/lib/jvm/java-17-openjdk/'
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH:$HOME/bin
export EDITOR=nvim
alias rm='trash-put'
alias ls='ls -all --color=auto'
#alias matlab='~/r2020a/bin/matlab.sh'
alias vi='nvim'
PS1="\[\e[0;31m\]\u@\[\e[m\e[0;34m\]\h\[\e[m \e[0;32m\]\W \$\[\e[m\]"


alias luamake=/home/syuan/library/lua-language-server/3rd/luamake/luamake
