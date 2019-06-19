#!/usr/bin/env python

f = open('./data', 'r').read()
open('./pic.png', 'w').write(f.decode('base64'))