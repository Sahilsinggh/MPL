section .bss
	digit: resb 1
	
section .text	
	global _start
	_start:
		mov rax,4
		call printRAXDigit
		
		mov rax,60
		mov rdi,0
		syscall
	
printRAXDigit: 
	add rax,30h
	mov [digit],rax
	mov rax,1
	mov rdi,1
	mov rsi,digit
	mov rdx,1
	syscall
	ret
	
