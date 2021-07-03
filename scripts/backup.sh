#!/bin/bash
rsync -aurvP "$@" raspi:/mnt/fileserver
