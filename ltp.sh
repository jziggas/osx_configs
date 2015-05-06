#!/bin/bash
# Lint-Test-Push
# Step 1: Have your changes commited and ready to push.
# Step 2: Git pull latest
# Step 3: Cut a hole in the box.
([[ -z $(git status -uno --porcelain) ]] && echo "Found no git changes. Running jshint.") || (echo 'Found either (1) changes to existing files, (2) newly added files, (3) deleted files. Commit or stash your changes before pushing!' && git status && kill -SIGPIPE $$);
lint_result=$(grunt jshint | tee >(cat 1>&2) | grep '>>');
lint_error=$(echo "$lint_result" | grep "error");

if [ ${#lint_error} -gt 0 ]; then echo "Lint errors found, cannot push to repo." ; exit
else echo "No lint errors found. Running grunt test-jenkins."
fi
jenkins_result=$(grunt test-jenkins | tee /dev/stderr | grep 'tests failed')
if [ ${#jenkins_result} -gt 0 ]; then echo "Jenkins errors found, cannot push to repo." ; exit
else echo "No jenkins errors found. Pushing to git!"
fi
git push
