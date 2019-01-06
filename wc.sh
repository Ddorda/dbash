dwc()
{
    # usage: dwc [-c] [-s $sep_char] FILE
    # can also use with stdin: dcat FILE | dwc

    sep_char=$'\n'
    if [[ "$1" == "-c" ]]; then
        filename="$2"
        count_chars=1
    elif [[ "$1" == "-s" ]]; then
        sep_char=$2
        filename="$3"
        count_chars=
    else
        filename="$1"
        count_chars=
    fi

    [ -z "$filename" ] && filename=/dev/stdin

    let count=0
    while IFS= read -r -N1 char
    do
        printf '%d ' $count; printf '%q\n' "$char"
        if [[ -n $count_chars ]]; then
            let count+=1
        else
            [[ "$char" == "$sep_char" ]] && let count+=1
        fi
    done < "$filename"
    echo $count
}