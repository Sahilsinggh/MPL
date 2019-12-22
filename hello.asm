section .data
  message: db "hello world",10
  length: equ $-message
section .text
  global _start
  _start:
    mov eax,4h
    mov ebx,1h
    mov ecx,message
    mov edx,length
    int 80h

    mov eax,1
    int 80h
