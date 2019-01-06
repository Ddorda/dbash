dhead()
{
	# usage: dhead -N FILE
    # can also be used with stdin: dcat FILE | dhead -10
	IFS=    	
    if [[ "$1" == "-c" ]]; then
	    head_lines="$2"
	    count_chars=1
	    sep_chars=""
    else
	    head_lines="$1"
	    sep_char=$'\n'
	fi
    head_lines=${head_lines//-}
    let counter=1
    while read -N1 char
    do
		if [[ $counter -le $head_lines ]]; then
            echo -n "${char}"
        fi
        if [[ $char == "$sep_char" && -z $count_chars ]]; then
            let counter+=1
        elif [[ -n $count_chars ]]; then
            let counter+=1
        fi
    done
}