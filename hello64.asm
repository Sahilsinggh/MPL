section .data
	message: db "hello world",0xa
	length: equ $ -message
	
section .text
	global _start
	_start:
		mov rax,01
		mov rdi,1
		mov rsi,message
		mov rdx,length
		syscall
		
		mov rax,60
		mov rdi,0
		syscall
		
