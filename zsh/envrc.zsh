function chpwd() {
    if [ -r $PWD/.env ]; then
        source $PWD/.envrc
    fi
}
