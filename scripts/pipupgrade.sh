#!/bin/bash
pip install --upgrade pip
pip list --format=freeze | grep -v ‘^\-e’ | cut -d = -f 1 | xargs -n1 pip install -U
