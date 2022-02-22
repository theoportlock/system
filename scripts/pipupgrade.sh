#!/bin/bash
pip3 install --upgrade pip3
pip list --outdated --format=freeze | grep -v ‘^\-e’ | cut -d = -f 1 | xargs -n1 pip3 install -U
