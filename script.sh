#!/bin/bash
CURRENT_DIR=$(dirname "$0")
set -x

rubocop

rubocop -c .rubocop.yml

rubocop -c "${CURRENT_DIR}/.rubocop.yml"

cat app/models/test_model.rb | rubocop -c "${CURRENT_DIR}/.rubocop.yml" \
    -s "${CURRENT_DIR}/app/models/test_model.rb"

cp "${CURRENT_DIR}/app/models/test_model.rb" /tmp/test_model.rb
cat "${CURRENT_DIR}/app/models/test_model.rb" | rubocop -c "${CURRENT_DIR}/.rubocop.yml" \
    -s /tmp/test_model.rb
