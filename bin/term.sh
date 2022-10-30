#!/usr/bin/env bash
# .Xresources changes weren't sticking for me so I'll usethis to start urxvt
set -eo pipefail

xrdb ~/.Xresources
urxvt
