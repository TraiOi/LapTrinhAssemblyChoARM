#!/bin/bash - 
#===============================================================================
#
#          FILE: gitpush.sh
# 
#         USAGE: ./gitpush.sh 
# 
#   DESCRIPTION: Pushing my git to github.com
# 
#        AUTHOR: TraiOi, 
#       CREATED: 10/23/2016 21:40
#===============================================================================

set -o nounset                              # Treat unset variables as an error

git add *
git commit -m "Updated $1"
git push
