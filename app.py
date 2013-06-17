#!/usr/bin/env python

import os, json
from bottle import route, template, static_file, request, redirect

from utils import dump_data, load_data, existed

@route('/', method = 'GET')
@route('/<name:re:\w+>', method = 'GET')
@route('/<name:re:\w+>', method = 'POST')
def graph(name = None):
    if name is not None:
        if request.method == 'GET':
            if existed(name):
                print 'here'
                data = load_data(name)
        elif request.method == 'POST':
            data = request.forms.get('data', None)
            try:
                data = [int(v.strip()) for v in data.split(',')]
            except:
                return redirect('/' + name)
            if data is not None:
                if not existed(name):
                    dump_data(name, data)
            else:
                return redirect('/' + name)
    return template('templates/graph', **locals())

@route('<path:re:/static/css/.*css>')
@route('<path:re:/static/js/.*js>')
def static(path, method = 'GET'):
    return static_file(path, root = '.')

