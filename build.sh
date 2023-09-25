#!/usr/bin/env bash
# exit on error
set -o errexit

pip install --upgrade pip
pip install poetry

poetry install

python manage.py collectstatic --no-input
python manage.py migrate
# Make sure the script is executable before checking it into Git: chmod a+x build.sh
# from StackOverflow: If the concern is the executable bit, you can run git update-index --chm od=+x run.sh after
# adding it to make it executable on platforms that support that concept.