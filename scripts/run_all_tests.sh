#!/bin/sh

echo "Running all tests"

(cd ../ && flutter test)
test $? -eq 0 || exit 1

echo "Tests Finished"
exit 0
