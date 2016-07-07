#!/bin/bash

LOOP=380
BUF=buf.c

rm -rf .git
git init
git add README.md makeCommit.sh template.c
git commit --date "`date -R -d "$LOOP day ago"`" -m "init"

cp template.c $BUF
for i in `seq 1 $LOOP`; do
    echo "// $i" >> $BUF
    git add $BUF
    git commit --date "`date -R -d "$(($LOOP - $i)) day ago"`" -m "day "$i
done

rm $BUF
git add -u
git commit -m "finish"

git remote add origin https://github.com/ynws/githubAllGreen.git
git push -f origin master
