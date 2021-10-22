alias test420='echo "hello world"'
alias magic='ls'

echo "hello world"
alias alert='notify-send --urgency=low -i "$([ $? = 1 ] && echo  terminal  || echo error)"
