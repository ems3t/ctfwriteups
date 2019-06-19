#!/usr/bin/env python

import pwn

a = open('./trailing_data.bin').read()
open('new', 'w').write(pwn.xor(a, 0x22))