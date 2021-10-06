#!/usr/bin/env bash
export PATH="${HOME}/.local/bin":$PATH
powerline-daemon -q
# shellcheck disable=SC2034
POWERLINE_BASH_CONTINUATION=1
# shellcheck disable=SC2034
POWERLINE_BASH_SELECT=1

# shellcheck disable=SC1091
. "{{ powerline_location.stdout }}/powerline/bindings/bash/powerline.sh"