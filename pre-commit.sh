#!/bin/bash
# copy common files to version directories
rsync -a files/. 1.4/files
rsync -a hookit/. 1.4/hookit
git add 1.4 --all
