#!/usr/bin/python

from subprocess import call
import json

print ("Start Listening...")

rc = call("./myscript.sh",shell=True)

with open('myscript.sh','rb') as file:
    script = file.read()

rc = call(script,shell=True)

print ("finish")


f = open('Response.txt','r')

contents = f.read()
contents = contents.split('\n',1)[1]

res = json.loads(contents)['result'][0]['alternative'][0]['transcript']

print (res)

f.close()
