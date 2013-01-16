  start() {
    sudo systemctl start $@
  }

  restart() {
    sudo systemctl restart $@
  }

  reload() {
    sudo systemctl reload $@
  }

  stop() {
    sudo systemctl stop $@
  }

  enable() {
    sudo systemctl enable $@
  }

  status() {
    systemctl status $@
  }

  disable() {
    sudo systemctl disable $@
  }

dwordnet () { curl dict://dict.org/d:${1}:wn; }
dacron () { curl dict://dict.org/d:${1}:vera; }
djargon () { curl dict://dict.org/d:${1}:jargon; }
dfoldoc () { curl dict://dict.org/d:${1}:foldoc; }
dthesaurus () { curl dict://dict.org/d:${1}:moby-thes; }
