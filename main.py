#!/usr/bin/env python
'''Simple flask application'''

from flask import Flask, request


#######################################################################
# Application: Hello World
#######################################################################


APP_HELLO_WORLD = Flask(__name__)


@APP_HELLO_WORLD.route('/')
def index():
    return f'You have come to the application index: {request.host}'


@APP_HELLO_WORLD.route('/helloworld')
def helloworld():
    return f'you have come to the hello_world endpoint: {request.host}'


@APP_HELLO_WORLD.route('/helloworld/hello')
def hello():
    return f'hello: {request.host}'


@APP_HELLO_WORLD.route('/helloworld/world')
def world():
    return f'world: {request.host}'


#######################################################################
# Application: Rich Man
#######################################################################


APP_RICH_MAN = Flask(__name__)

@APP_RICH_MAN.route('/richman')
def richman():
    return f'you have come to the richman endpoint: {request.host}'


@APP_RICH_MAN.route('/richman/rich')
def rich():
    return f'rich: {request.host}'


@APP_RICH_MAN.route('/richman/man')
def man():
    return f'man: {request.host}'
