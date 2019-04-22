#!/usr/bin/env bash

. ~/.virtualenvs/bin/activate

rm -f pep8.log pyflakes.log

PYTHONPATH=. python -m /usr/lib64/python2.7/site-packages/coverage run test.py

python -m /usr/lib64/python2.7/site-packages/coverage xml -o coverage.xml
python -m /usr/lib64/python2.7/site-packages/coverage html -d /usr/lib64/python2.7/site-packages/coverage

pep8 --max-line-length=120 pystache > pep8.log || true
pyflakes pystache > pyflakes.log || true
