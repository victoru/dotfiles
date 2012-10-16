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
