if [[ -d ~/.mozilla-backup_asd ]]; then
    rm ~/.mozilla
    mv .mozilla-backup_asd .mozilla
fi
