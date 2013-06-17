#!/usr/bin/env python

import os
from bottle import route, template, static_file, request

@route('/', method = 'GET')
@route('/', method = 'POST')
def graph():
    data = request.forms.get('data', None)
    if data is not None and data.strip() != '':
        data = [int(v.strip()) for v in data.split(',')]
    return template('templates/graph', **locals())

@route('<path:re:/static/css/.*css>')
@route('<path:re:/static/js/.*js>')
def static(path, method = 'GET'):
    return static_file(path, root = '.')

