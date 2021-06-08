#!/bin/bash
parallel --nonall --progress -S moto,moto_old,moto_old_old,sony,tablet watch pstree -a
