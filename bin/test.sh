#!/usr/bin/env bash

### Bash Environment Setup
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
# set -o xtrace
set -o errexit
set -o errtrace
set -o nounset
set -o pipefail
IFS=$'\n'

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."

if [[ "${PIPENV_ACTIVE:-0}" -eq 1 ]]; then
    echo 'Using pipenv shell'
else
  source "$PWD/.venv/bin/activate"
fi

export TIMEZONE='UTC'

pytest -s --basetemp=tests/out --ignore=archivebox/vendor --ignore=deb_dist --ignore=pip_dist --ignore=brew_dist
