#!/bin/bash

commit_hash=${1:0:7}
git show $commit_hash
