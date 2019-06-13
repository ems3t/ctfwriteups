#!/usr/bin/env python

flag = open('./flag.txt').read()
b = ""
def decrypt(a):
	b = a.decode('base64')
	if '}' in b:
		print b
		return
	else:
		decrypt(b)
decrypt(flag)