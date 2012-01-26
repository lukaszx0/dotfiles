function chpwd() {
    if [ -r $PWD/.heroku ]; then
        source $PWD/.heroku
    fi
}
