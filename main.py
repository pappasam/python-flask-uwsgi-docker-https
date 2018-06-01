#!/usr/bin/env python
'''Simple flask application'''

from flask import Flask


APP_HELLO_WORLD = Flask(__name__)


@APP_HELLO_WORLD.route('/hello')
def hello():
    return 'hello'


@APP_HELLO_WORLD.route('/world')
def world():
    return 'world'


APP_RICH_MAN = Flask(__name__)


@APP_RICH_MAN.route('/rich')
def rich():
    return 'rich'


@APP_RICH_MAN.route('/man')
def man():
    return 'man'
