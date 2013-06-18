#!/usr/bin/env python

import os, json
from bottle import route, template, static_file, request, redirect

from utils import dump_data, load_data, existed, list_data

@route('/', method = 'GET')
@route('/<name:re:\w+>', method = 'GET')
@route('/<name:re:\w+>', method = 'POST')
def graph(name = None):
    names = list_data()
    if name is not None:
        if request.method == 'GET':
            if existed(name):
                data = load_data(name)
        elif request.method == 'POST':
            try:
                data = request.forms.get('data', None)
                data = [int(v.strip()) for v in data.split(',')]
                if data is not None:
                    if not existed(name):
                        dump_data(name, data)
            except:
                return redirect('/' + name)
    return template('templates/graph', **locals())

@route('<path:re:/static/css/.*css>')
@route('<path:re:/static/js/.*js>')
def static(path, method = 'GET'):
    return static_file(path, root = '.')

