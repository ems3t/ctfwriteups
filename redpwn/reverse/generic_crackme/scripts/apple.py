#!/usr/bin/env python

from pwn import *

p = process('./generic_crackme')
print p.recv()
payload = chr(0x65-1)
payload+= chr(0x70-1)
payload+= chr(0x68-1)
payload+= chr(0x68-1)
payload+= chr(0x7a-1)
p.sendline(payload)
p.recv()
print 'Password is: '+payload