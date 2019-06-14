#!/usr/bin/env python
from brute import brute
import hashlib

hashed = 'e82a4b4a0386d5232d52337f36d2ab73'

for s in brute(length=5, letters=False, numbers=True, symbols=False):
	flag = 'ctflag'+s
	if hashlib.md5(flag).hexdigest() == hashed:
		print flag
		break
