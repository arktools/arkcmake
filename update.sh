#!/bin/bash
git clone git@github.com:jgoppert/arkCMake.git tmp
rm -rf tmp/.git
mv tmp/* .
rm -rf tmp
