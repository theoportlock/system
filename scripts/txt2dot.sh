#!/bin/bash
cat $1 | python3 ~/system/scripts/txt2dot.py | dot -Tsvg > $1.svg
