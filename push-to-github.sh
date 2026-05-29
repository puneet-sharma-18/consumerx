#!/usr/bin/env bash
#
# push-to-github.sh — initialise this folder as a git repo and push it
# to your GitHub account, ready for Netlify to sync.
#
# USAGE:
#   1) Create an EMPTY repo on GitHub named "consumerX" (no README/license):
#        https://github.com/new   (Owner: puneet-sharma-18, Name: consumerX)
#   2) From inside this folder, run:
#        bash push-to-github.sh
#
# It will use HTTPS by default. To use SSH instead, run:
#        REMOTE=ssh bash push-to-github.sh

set -e

USER="puneet-sharma-18"
REPO="consumerX"
BRANCH="main"

if [ "${REMOTE:-https}" = "ssh" ]; then
  URL="git@github.com:${USER}/${REPO}.git"
else
  URL="https://github.com/${USER}/${REPO}.git"
fi

echo "→ Repo URL: ${URL}"

# init if needed
if [ ! -d .git ]; then
  git init
fi

git add -A
git commit -m "Deploy ConsumerX Ventures site" || echo "(nothing new to commit)"
git branch -M "${BRANCH}"

# set or update the remote
if git remote | grep -q "^origin$"; then
  git remote set-url origin "${URL}"
else
  git remote add origin "${URL}"
fi

git push -u origin "${BRANCH}"

echo ""
echo "✓ Pushed to ${URL} (branch: ${BRANCH})"
echo "  Next: connect this repo in Netlify (Publish directory = '.', no build command)."
