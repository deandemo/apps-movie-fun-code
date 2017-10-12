#!/bin/bash

set -e +x

pushd movie-service
  echo "Executing tests"
  MOVIE_FUN_URL=http://movie-service-dutiable-multijedt.apps.cumuluslabs.io/ ./mvnw clean test
popd

find movie-service/target/surefire-reports -type f -name *.txt -exec cp "{}" test-output/smoke-test.txt \;

echo "Done testing"
exit 0
