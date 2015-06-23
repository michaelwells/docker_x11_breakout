#!/bin/bash

# Grab an existing terminal, spawn a new one and then type a command

term_window=$(xdotool search --class --limit 1 terminal)

xdotool windowraise $term_window key ctrl+shift+n sleep 0.1 type "whoami"
xdotool key KP_Enter
xdotool sleep 0.1 type "This could have run something much worse"
