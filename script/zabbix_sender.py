#!/usr/bin/env python
# -*- coding: utf-8 -*-
# from https://www.zabbix.com/forum/showthread.php?t=23364
# Copyright 2011 Enrico Tröger <enrico(dot)troeger(at)uvena(dot)de>
# License: GNU GPLv2


"""
Minimal implementation of the Zabbix sender protocol in Python.

It should just show the basic idea, there is no error handling at all.
"""

import socket
import struct
import json


HOST = '192.168.0.203'
PORT = 10051


HEADER = '''ZBXD\1%s%s'''
# just some data
DATA = '''{
"request":"sender data",
"data":[
{
"host":"host",
"key":"test[1]",
"value":"7146.21",
"clock":1315606978},
{
"host":"host",
"key":"test[2]",
"value":"7146.21",
"clock":1315606978}
],
"clock":1315930538.02}
'''


data_length = len(DATA)
data_header = struct.pack('i', data_length) + '\0\0\0\0'

data_to_send = HEADER % (data_header, DATA)

# here really should come some exception handling
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((HOST, PORT))


# send the data to the server
sock.send(data_to_send)

# read its response, the first five bytes are the header again
response_header = sock.recv(5)
if not response_header == 'ZBXD\1':
    raise ValueError('Got invalid response')

# read the data header to get the length of the response
response_data_header = sock.recv(8)
response_data_header = response_data_header[:4] # we are only interested in the first four bytes
response_len = struct.unpack('i', response_data_header)[0]

# read the whole rest of the response now that we know the length
response_raw = sock.recv(response_len)

sock.close()

response = json.loads(response_raw)

print response
