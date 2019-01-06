
dtail()
{
    # usage: dtail [-c] [-s $sep_char] -N FILE
    # can also be used with stdin: dcat FILE | dtail -10
    #
    # there's a bug for -c and -s ' ' that it writes another cycle,
    # so you need to use -0 for now for those
    (
    IFS=
    data=""
    echo -n > /tmp/dtail.out
    while read -N1 char
    do
        # temp hack. need to keep in variable somehow
        echo -n "$char" >> /tmp/dtail.out
    done
    sep_char=$'\n'
    if [[ "$1" == "-c" ]]; then
        filename="$3"
        tail_lines="$2"
        count_chars=1
        tail_lines=${tail_lines//-}
        if [ -z "$filename" ]; then
            filename=/tmp/dtail.out
        fi
        file_lines=$(dwc -c "$filename")
    elif [[ "$1" == "-s" ]]; then
        sep_char=$2
        filename="$4"
        tail_lines="$3"
        count_chars=
        tail_lines=${tail_lines//-}
        if [ -z "$filename" ]; then
            filename=/tmp/dtail.out
        fi
        file_lines=$(dwc -s "$sep_char" "$filename")
    else
        filename="$2"
        # echo filename $filename
        tail_lines="$1"
        count_chars=
        tail_lines=${tail_lines//-}
        if [ -z "$filename" ]; then
            filename=/tmp/dtail.out
        fi
        file_lines=$(dwc "$filename")
    fi

    let tail_from_line=$file_lines-$tail_lines
    let counter=0
    if [ -z "$filename" ]; then
        IFS=
        while read -N1 char
        do
            # echo $counter $tail_from_line $char
            if [[ $counter -ge $tail_from_line ]]; then
                echo -n "${char}"
            fi
            if [[ $char == "$sep_char" && -z $count_chars ]]; then
                let counter+=1
            elif [[ -n $count_chars ]]; then
                let counter+=1
            fi
        done
    else
        exec 3<> "${filename}"
        IFS=
        while read -N1 -u3 char
        do
            if [[ $counter -ge $tail_from_line ]]; then
                echo -n "${char}"
            fi
            if [[ $char == "$sep_char" && -z $count_chars ]]; then
                let counter+=1
            elif [[ -n $count_chars ]]; then
                let counter+=1
            fi
        done
        exec 3<&-
    fi
    )
}