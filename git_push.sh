#!/bin/bash
set -euo pipefail

git pull
git add .
git commit -m "auto"
git push

