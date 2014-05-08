#!/bin/bash

for x in $(xdotool search --name "Adobe Reader") ; do 
    xdotool key --window $x ctrl+r; 
done
