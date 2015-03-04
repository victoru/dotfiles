  #start() {
    #sudo systemctl start $@
  #}

  #restart() {
    #sudo systemctl restart $@
  #}

  #reload() {
    #sudo systemctl reload $@
  #}

  #stop() {
    #sudo systemctl stop $@
  #}

  #enable() {
    #sudo systemctl enable $@
  #}

  status() {
    systemctl status $@
  }

  #disable() {
    #sudo systemctl disable $@
  #}

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
    mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }

gocd () { cd `go list -f '{{.Dir}}' $1` }

#ownedby,owner
pkgowner() { pacman -Qo `which $1` }


