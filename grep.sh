_dgrep_stdin()
{
    match="$1"
    ret=1
    while read line
    do
        if [[ $line == *"${match}"* ]]; then
          echo $line 
          ret=0     
        fi
    done
    return $ret
}

dgrep()
{
    # usage: dgrep MATCH FILE
    # can also be used with stdin:
    # dcat FILE | dgrep MATCH
    match="$1"
    filename="$2"
    if [ -n "$filename" ]; then
        dcat "${filename}" | _dgrep_stdin "${match}"
    else
        _dgrep_stdin "${match}"
    fi
    return $?
}
