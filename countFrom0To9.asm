section .data
	buf:        RESB '0'
	counter:    db '0', 0xA
	counterLen: equ $-counter

section .text
	global _start

_start:
  mov ecx,10
  L1:
    mov [buf], ecx

    mov eax, 4 
    mov ebx, 1
    mov ecx, counter
    mov edx, counterLen
    int 80h
    
    inc word [counter]
    
    mov ecx, [buf]
  Loop L1
  
  mov eax,1
  mov ebx,0
  int 80h
