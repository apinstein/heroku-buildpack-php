#!/bin/bash
export PATH=/app/bin:/app/apache/bin:/app/php/bin:$PATH
# it's bad (security-wise) to use LD_LIBRARY_PATH; need to fix our build process so that the apps know to look in /app/... but not sure how yet...
export LD_LIBRARY_PATH=/app/apache/lib:/app/lib

alias l='ls -al'
