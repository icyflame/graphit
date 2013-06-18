#!/usr/bin/env python

import os, json

def existed(name):
    datafile = os.path.dirname(os.path.realpath(__file__)) + '/data/' + str(name)
    return os.path.exists(datafile)

def dump_data(name, data):
    datadir = os.path.dirname(os.path.realpath(__file__)) + '/data'
    if not os.path.exists(datadir):
        os.mkdir(datadir)
    datafile = datadir + '/' + str(name)
    return open(datafile, 'w').write(json.dumps(data))

def load_data(name):
    datafile = os.path.dirname(os.path.realpath(__file__)) + '/data/' + str(name)
    return json.loads(open(datafile).read())

def list_graphs():
    datadir = os.path.dirname(os.path.realpath(__file__)) + '/data'
    return os.listdir(datadir)
