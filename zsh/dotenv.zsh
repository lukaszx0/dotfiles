function chpwd() {
    if [ -r $PWD/.env ]; then
        source $PWD/.env
    fi
}
