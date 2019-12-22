%macro print 2
	mov rax,1
	mov rdi,1
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro

section .data
	array: dq 4,5,2,1,6,1,4,7,9
	n: equ 13
	space: db " "
	
section .bss
	digit: resb 1
	
	
section .text
	global _start
	_start:
		mov rbx,array
		mov r8,n
		
		begin:
		mov rax,[rbx]
		call printRAXDigit
		print space,1
		
		update:
		add rbx,8
		dec r8
		jnz begin
		
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
