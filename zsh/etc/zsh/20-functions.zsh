status() {
	systemctl status $@
}

dwordnet () { curl dict://dict.org/d:${1}:wn; }
dacron () { curl dict://dict.org/d:${1}:vera; }
djargon () { curl dict://dict.org/d:${1}:jargon; }
dfoldoc () { curl dict://dict.org/d:${1}:foldoc; }
dthesaurus () { curl dict://dict.org/d:${1}:moby-thes; }

function f {
	fg %$1
}

say() {
    if [[ "${1}" =~ -[a-z]{2} ]]; then
        local lang=${1#-};
        local text="${*#$1}";
    else
        local lang=${LANG%_*};
        local text="$*";
    fi;

    tmpdir=$(mktemp -d)

    curl 'https://translate.google.com/translate_tts?ie=UTF-8&q='"${text}"'&tl=en&client=tw-ob' \
        -H 'Referer: http://translate.google.com/' \
        -H 'User-Agent: stagefright/1.2 (Linux;Android 5.0)' \
        > ${tmpdir}/google_tts.mp3

    mplayer "${tmpdir}/google_tts.mp3"
    # with token (tk)
    #curl 'https://translate.google.com/translate_tts?ie=UTF-8&q=hello&tl=en&tk=995126.592330&client=t' -H 'user-agent: stagefright/1.2 (Linux;Android 5.0)' -H 'referer: https://translate.google.com/' > google_tts.mp3
    #http://translate.google.com/translate_tts
    #https://translate.google.com/translate_tts?ie=UTF-8&q=Spectrographyd&tl=en&total=1&idx=0&textlen=14&tk=181270.320436&client=t&prev=input&ttsspeed=0.24
}

gocd () { cd `go list -f '{{.Dir}}' $1` }

#ownedby,owner
owner () { pacman -Qo `which $1` }

function join { local IFS="$1"; shift; echo "$*"; }

showerthought() {
    curl -s --connect-timeout 5 -A '/u/your_user_name' \
        'https://www.reddit.com/r/showerthoughts/top.json?sort=top&t=week&limit=100' | \
        python2.7 -c 'import sys, random, json; randnum = random.randint(0,99); response = json.load(sys.stdin)["data"]["children"][randnum]["data"]; print "\n\"" + response["title"] + "\""; print "    -" + response["author"] + "\n";'
}
