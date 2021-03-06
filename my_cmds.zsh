# ~/.oh-my-zsh/custom

# aliases

alias df='df -h'
alias less='less -R'
alias ls='CLICOLOR_FORCE=1 ls -G'


# functions

function buildcpp () {
    clang++ -std=c++17 $1
}

# Use lf to switch directories and bind it to ctrl-o
function lfcd () {
    local tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        local dir="$(cat "$tmp")"
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

# change file name encoding
# usage : chnenc path from_enc to_enc
function chnenc () {
    find $1 ! -path . -depth -exec sh -c 'x=$( mv "$0" "$0_tmp" ; echo "$0" | iconv -f '$2' -t '$3' ) ; mv "$x"_tmp "$x"' '{}' \;
}

# change file name encoding to NFC
# usage : chn2NFC path
# example for a current dir : chn2NFC .
# example for a specific dir (include dir) : chn2NFC dir
# example for a specific dir (exclude dir) : chn2NFC dir/*
# example for a specific file : chn2NFC file
function chn2NFC () {
    chnenc $1 UTF8-MAC UTF8
}
