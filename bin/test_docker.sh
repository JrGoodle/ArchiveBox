#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."

# docker build . -t archivebox
# docker run -it \
#     -v "$PWD/data:/data" \
#     archivebox init --setup
docker run -it -p 8000:8000 \
    -v "$PWD/data:/data" \
    -v "$PWD/archivebox:/app/archivebox" \
    archivebox server 0.0.0.0:8000 --debug --reload
