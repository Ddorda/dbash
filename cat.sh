dcat()
{
    # usage: dcat FILE
    # can also be ued with stdin:
    # dcat <<EOF
    # Dor Aya Po!
    # EOF
    (
    filename="$1"
    [ -z "$filename" ] && filename=/dev/stdin

    IFS=
    while IFS= read -r -N1 -d'\0' char
    do
        printf '%c' "$char"
    done < "$filename"
    )
}
