#!/usr/bin/env python

f = open('./Bleep', 'r')
message = ""
a = f.read().replace(chr(0x7), ".")
for i in a:
	if i == '.':
		message+= '.'
	else:
		message+= '_'
print message