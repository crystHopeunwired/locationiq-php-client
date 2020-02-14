#!/bin/bash
#
# name: Org
# repository: main
# branch: master

# -----

# name: OrgFork (A organization of mine with forks from **Org**) 
# repository: main
# branch: testing

#hub pull-request "Testing pull-request" -b Org:master -h OrgFork:testing
PR_MSG=Testing pull-request
GIT_USER=crystHopeunwired
BRANCH_NAME=test-branch

CMD="hub pull-request $PR_MSG -b $GIT_USER:master -h $GIT_USER:$BRANCH_NAME"

echo $CMD