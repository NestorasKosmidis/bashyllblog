#!/bin/bash

#Reads title from STDIN
#Replace spaces with dashes in the title, and convert to lowercase
tr '[:upper:]' '[:lower:]' | tr ' ' '-'
