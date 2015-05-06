#!/bin/bash
git_status=$(git status | tee /dev/stderr | grep 'Changes not staged for commit')
if [ ${#git_status} -gt 0 ]; then echo "Unstaged changes found. Commit or stash your changes before pushing!" ; exit
else echo "No unstaged changes found. Running jshint."
fi
lint_result=$(grunt jshint | tee /dev/stderr | grep '>>')
lint_error=$(echo "$lint_result" | grep "error")
if [ ${#lint_error} -gt 0 ]; then echo "Lint errors found, cannot push to repo." ; exit
else echo "No lint errors found. Running grunt test-jenkins."
fi
jenkins_result=$(grunt test-jenkins | tee /dev/stderr | grep 'tests failed')
if [ ${#jenkins_result} -gt 0 ]; then echo "Jenkins errors found, cannot push to repo." ; exit
else echo "No jenkins errors found. Pushing to git!"
fi
git push
