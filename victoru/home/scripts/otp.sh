#!/bin/bash

KEYFILE=~/.otpkeys.gpg            # Some secure location
GPG_RECIPIENT="<victor.unegbu@rewardstyle.com>" # your own e-mail with GPG
VERBOSE="false"                   # [true | false]
ACTION="print-and-copy"           # [qr | print-and-copy | print ]
DELAY=4                           # your delay between copy and paste
#export GNUPGHOME=${HOME}/.gnupg.rewardstyle

##################################################################
# DO NOT EDIT BELOW
##################################################################

GPG="gpg"
GPG_OPTS=( "--quiet" "--yes" "--compress-algo=none" "--no-encrypt-to" )

############
# Nice logs
############

iecho(){
    if [ "$VERBOSE" == "true" ];then
        echo -e "\e[34mINFO\e[39m: $1"
    fi
}
wecho(){
    echo -e "\e[33mWARNING\e[39m: $1"
}
eecho(){
    echo -e "\e[31mERROR\e[39m: $1"
    exit 1
}

############
# Help function
############

ehelp(){
    cat << EOF
Basic
  otp account

Edit
  otp -a|--action edit

Print QR code for an account
  otp -a qr account

Help
  otp help
EOF
}

############
# Check dependencies
############

check_dep(){
    case $1 in
        basic)
            # gpg: file encryption
            # oathtool: the OTP function itself
            # yq: read keys from config file
            # bc: do calculations
            for item in gpg oathtool yq bc; do
                if ! [ -x "$(command -v $item)" ]; then
                    eecho "$item is not installed."
                fi
            done
            # keyfile needs to exist
            if ! [[ -f $KEYFILE ]]; then
                wecho "Can't find keyring file. run \"otp -a edit\""
            fi
            ;;
        clip)
            # pbcopy for clipboard interaction
            if ! [ -x "$(command -v pbcopy)" ]; then
                eecho 'pbcopy is not installed.'
            fi
            ;;
        qr)
            # qrencode for printing QR codes
            if ! [ -x "$(command -v qrencode)" ]; then
                eecho 'qrencode is not installed.'
            fi
            ;;
    esac
}

tmpdir() {
    [[ -n $SECURE_TMPDIR ]] && return
    local template="$PROGRAM.XXXXXXXXXXXXX"
    if [[ -d /dev/shm && -w /dev/shm && -x /dev/shm ]]; then
        SECURE_TMPDIR="$(mktemp -d "/dev/shm/$template")"
        remove_tmpfile() {
            rm -rf "$SECURE_TMPDIR"
        }
        trap remove_tmpfile INT TERM EXIT
    else
        wecho "Your system does not have /dev/shm, which means that it may
              be difficult to entirely erase the temporary non-encrypted
              password file after editing."
        SECURE_TMPDIR="$(mktemp -d "${TMPDIR:-/tmp}/$template")"
        shred_tmpfile() {
            if [ -n "$SHRED" ]; then
                find "$SECURE_TMPDIR" -type f -exec "$SHRED" {} + ;
            fi
            rm -rf "$SECURE_TMPDIR"
        }
        trap shred_tmpfile INT TERM EXIT
    fi

}

cmd_edit() {
    tmpdir # Defines $SECURE_TMPDIR
    local tmp_file
    tmp_file="$(mktemp -u "$SECURE_TMPDIR/XXXXX").txt"
    if [ -f $KEYFILE ]; then
        $GPG "${GPG_OPTS[@]}" -o "$tmp_file" -d $KEYFILE
    fi

    ${EDITOR:-editor} "$tmp_file"
    [[ -f $tmp_file ]] || eecho "New password not saved."
    while ! $GPG -e -r $GPG_RECIPIENT -o "$KEYFILE" "${GPG_OPTS=[@]}" "$tmp_file"; do
        wecho -n "GPG encryption failed. Would you like to try again? [Y/n] "
        read -r line
        if [ "$line" == "n" ]; then
            exit 1
        fi
    done
    iecho "File $KEYFILE saved"
}

cmd_get_otp() {
    check_dep basic
    if [[ "$1" == "" ]]; then
        echo "No account set use help"
    else
        otpkey=$(gpg --quiet -d $KEYFILE | yq e ".$1".otpSecret -)

        if [ "$otpkey" == "null" ]
        then
            eecho "Bad Service Name"
            exit
        fi

        period=$(gpg --quiet -d $KEYFILE | yq e ".$1".period -)
        if [ "$period" == "null" ]
        then
            iecho "No period defined for $1, defauling back to 30 sec"
            period="30"
        fi

        time_left=$(echo "$period - $(date +%S) % $period" | bc )
        if [ "$time_left" -lt "$DELAY" ] && [ "$time_left" -ne "0" ]; then
            echo "Waiting $time_left second ..."
            sleep "$time_left" 0.1
        fi

        otp=$(oathtool --totp -b "$otpkey" | tr -d '\n')
        #echo $2
        #exit
        if $2; then
            check_dep clip
            iecho "Print and copy OTP code for $ACCOUNT"
            pbcopy <<< "$otp"
            echo "$otp"
        else
            iecho "Printing OTP code for $ACCOUNT"
            echo "$otp"
        fi
    fi
}

print_qr() {
    check_dep basic
    check_dep qr
    if [[ "$ACCOUNT" == "" ]]; then
        eecho "No account set use help"
    else
        iecho "Printing QR code for $ACCOUNT"
        account=$(gpg --quiet -d $KEYFILE | yq e ".$1" -)
        if [ -z "$account" ] || [ "$account" == "null" ]; then
            eecho "Could not retrieve account data"
        fi
        otptype=$(yq e .type - <<< "$account")
        if ! [ "$otptype" == "totp" ]
        then
            wecho "cli option for this account will not work (not supported type)"
        fi
        otpSecret=$(yq e .otpSecret <<< "$account")
        otplabel=$(yq e .label <<< "$account")
        otpissuer=$(yq e .issuer <<< "$account")
        period=$(yq e ".$1".period <<< "$account")
        if [ "$period" == "null" ]
        then
            iecho "No period defined for $ACCOUNT, defauling back to 30 sec"
            period="30"
        fi
        qrencode -t UTF8 "otpauth://$otptype/$otplabel?secret=$otpSecret&issuer=$otpissuer&period=$period"
    fi
}

edit_file() {
    if [[ "$ACCOUNT" == "" ]]; then
        iecho "Editing the keyfile"
        cmd_edit
    else
        wecho "Editing individual account is not supported"
        ehelp
    fi
}


if [[ $# -lt 1 ]]; then
    wecho "No parameter given"
    ehelp
    exit
else

    while [[ $# -gt 0 ]]; do
        key="$1"

        case $key in
            -a|--action)
                ACTION="$2"
                shift
                ;;
            -h|--help|help)
                ehelp
                exit
                ;;
            *)
                ACCOUNT=$key
                ;;
        esac
        shift
    done
fi



case $ACTION in
    print-and-copy)
        cmd_get_otp "$ACCOUNT" true
        ;;
    print)
        cmd_get_otp "$ACCOUNT"
        ;;
    qr)
        print_qr "$ACCOUNT"
        ;;
    edit)
        edit_file "$ACCOUNT"
        ;;
esac

