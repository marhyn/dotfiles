if status is-interactive
    # Commands to run in interactive sessions can go here
end

function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent

alias pa="php artisan"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marhyn/google-cloud-sdk/path.fish.inc' ]; . '/Users/marhyn/google-cloud-sdk/path.fish.inc'; end
