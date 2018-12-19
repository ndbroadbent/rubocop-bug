# RuboCop Issue

Issue when using a custom config file with a full path.

## Reproduce

Run `./script.sh`.


### With file

```bash
git clone https://github.com/ndbroadbent/rubocop-bug.git /tmp/rubocop-bug
cd /tmp/rubocop-bug

rubocop
Inspecting 1 file
.

1 file inspected, no offenses detected
```

```bash
rubocop -c .rubocop.yml
Inspecting 1 file
.

1 file inspected, no offenses detected
```

```bash
rubocop -c /tmp/rubocop-bug/.rubocop.yml
Inspecting 1 file
W

Offenses:

app/models/test_model.rb:6:5: W: Lint/UnneededCopDisableDirective: Unnecessary disabling of Rails/Output.
    # rubocop:disable Rails/Output
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1 file inspected, 1 offense detected
```

### With stdin

```
cat app/models/test_model.rb | rubocop -c /tmp/rubocop-bug/.rubocop.yml \
    -s /tmp/rubocop-bug/app/models/test_model.rb
Inspecting 1 file
.

1 file inspected, no offenses detected
```

```
cp app/models/test_model.rb /tmp/test_model.rb
cat app/models/test_model.rb | rubocop -c /tmp/rubocop-bug/.rubocop.yml \
    -s /tmp/test_model.rb
Inspecting 1 file
W

Offenses:

/tmp/test_model.rb:6:5: W: Lint/UnneededCopDisableDirective: Unnecessary disabling of Rails/Output.
    # rubocop:disable Rails/Output
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1 file inspected, 1 offense detected
```
