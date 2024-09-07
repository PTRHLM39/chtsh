#!/usr/bin/env bash

sheet_cheat=$(curl -s cht.sh/:list | fzf)
curl -s cht.sh/$sheet_cheat | less -R
