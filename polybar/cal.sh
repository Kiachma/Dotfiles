#!/bin/bash
gcal list -C /home/eaura/Dotfiles/polybar/gcalConf.json 'from now to one week from now' | sed -n 2p