#!/bin/bash

set -x

rubocop

rubocop -c .rubocop.yml

rubocop -c /tmp/rubocop-bug/.rubocop.yml

cat app/models/test_model.rb | rubocop -c /tmp/rubocop-bug/.rubocop.yml \
    -s /tmp/rubocop-bug/app/models/test_model.rb

cp app/models/test_model.rb /tmp/test_model.rb
cat app/models/test_model.rb | rubocop -c /tmp/rubocop-bug/.rubocop.yml \
    -s /tmp/test_model.rb
