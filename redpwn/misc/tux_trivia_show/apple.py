#!/usr/bin/env python

from pwn import *

p = remote('chall.2019.redpwn.net', 6001)

print p.recv()
p.sendline('Castria')
p.interactive()