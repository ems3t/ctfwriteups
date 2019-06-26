#!/usr/bin/env python

from pwn import *

p = remote('buffer-overflow.ctfcompetition.com', 1337)

print p.recv()