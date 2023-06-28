from encodings import utf_8
import serial
import os, sys
# coding=utf-8

port = 'COM9'
baudrate = 9600                     #taxa de transmição
ser = serial.Serial(port, baudrate)


while 1:   #loop para dados
    t = ser.readline().rstrip()
    if t == b'\x00':
        break
    print(t.decode())

ser.close()