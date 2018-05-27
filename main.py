#!/usr/bin/env python
'''Simple flask application'''

from flask import Flask

APP = Flask(__name__)

@APP.route('/')
def index():
    return "hello"

@APP.route('/world')
def world():
    return "hello, world"

if __name__ == '__main__':
    APP.run()
