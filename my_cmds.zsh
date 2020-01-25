# ~/.oh-my-zsh/custom

# aliases

alias df='df -h'


# functions

function buildcpp () {
    clang++ -std=c++17 $1
}

# Use lf to switch directories and bind it to ctrl-o
function lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
fi
}
bindkey -s '^o' 'lfcd\n'

: '
change file encoding

usage:
chfenc filename from_enc to_enc

example:
chfenc "*.smi" cp949 utf8
'
function chfenc () {
    find . -type f -name $1 -exec sh -c 'iconv -f '$2' -t '$3' "$0" > "$0.tmp"' '{}' \; -exec mv -f '{}.tmp' '{}' \;
}
