_count()
{
    # used as a hack, because {$from..$to} doesn't work
    # usage: _count $from_num $to_num
    from_num="$1"
    to_num="$2"
    # if [[ $from_num -eq $to_num ]]; then
    #     output=""
    # else
    output=$(eval "for i in {${from_num}..${to_num}}; do echo -n \"\$i \"; done")
    # fi
    echo $output
}

_ord()
{
    # convert ascii char to integer
    # usage: _ord CHAR
    printf '%d\n' "'$1"
}

_chr()
{
    # convert integer to ascii char
    # usage: _ord NUMBER
    printf "\\$(printf '%03o' "$1")"
}