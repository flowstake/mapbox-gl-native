#!/bin/bash

tests=`fgrep mean $1 | cut -c1-85 | grep 91m`

if [ -z "$tests" ]
then
      echo "PASSED, all benchmarks within 5% threshold"
      exit 0
else
      echo ""
      echo "FAILED, following benchmarks are not within 5% threshold:"
      echo ""
      tests=`fgrep mean $1 | cut -c1-85 | grep 91m | cut -f1 -d' '`
      for t in $tests;
      do
        echo $t
      done
      exit 1
fi
