#!/bin/bash
################################
# Author: Abhishek
# Version: v1
#
#
#
# This script will help users to communicate and retrieve information from GitHub
# Usage:
#   Please provide your github token and rest api to the script as input
#
################################

# if user passes < 2 arguments, then throw an error and state the correct format
if [ ${#@} -lt 2 ]; then
    echo "usage: $0 [your github token] [REST expression]"
    exit 1;
fi

# copy the 2 inputs given by user to variables GITHUB_TOKEN, GITHUB_API_REST
GITHUB_TOKEN=$1
GITHUB_API_REST=$2

# header type - Setting to application/vnd.github+json is recommended.
# reference - github api docs
GITHUB_API_HEADER_ACCEPT="Accept: application/vnd.github.v3+json"

# The basename command allows us to strip the directory and suffix from filenames. We can use it to find the script’s filename.
temp=`basename $0`
# store the information returned by github in a temporary file. 
TMPFILE=`mktemp /tmp/${temp}.XXXXXX` || exit 1

# make the REST API call
function rest_call {
    curl -s $1 -H "${GITHUB_API_HEADER_ACCEPT}" -H "Authorization: token $GITHUB_TOKEN" >> $TMPFILE
}

# single page result-s (no pagination), have no Link: section, the grep result is empty
last_page=`curl -s -I "https://api.github.com${GITHUB_API_REST}" -H "${GITHUB_API_HEADER_ACCEPT}" -H "Authorization: token $GITHUB_TOKEN" | grep '^Link:' | sed -e 's/^Link:.*page=//g' -e 's/>.*$//g'`

# does this result use pagination?
if [ -z "$last_page" ]; then
    # no - this result has only one page
    rest_call "https://api.github.com${GITHUB_API_REST}"
else

    # yes - this result is on multiple pages
    for p in `seq 1 $last_page`; do
        rest_call "https://api.github.com${GITHUB_API_REST}?page=$p"
    done
fi

cat $TMPFILE
