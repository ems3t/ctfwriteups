#!/usr/bin/env python
from pwn import *
import base64

a = open('./base.txt', 'r')
print a.readlines()

n