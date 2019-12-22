%macro print 2
	mov rax,1
	mov rdi,1
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro

section .data
	msg: db " sum = "
	len: equ $ -msg
	arr: dq -120,60,40,20,1,2,3
	n: equ 7
	
section .bss
	digit: resb 1
	
section .text
	global _start
	_start:
		mov r8,arr
		mov r9,n
		mov rax,0
		
		begin:
		add rax,[r8]
		
		update:
		add r8,8
		dec r9
		jnz begin
		
		mov r10,rax
		
		print msg,len
		
		call printR10Digit
		
		mov rax,60
		mov rdi,0
		syscall
		
		
		
		
		
printR10Digit: 
	add r10,30h
	mov [digit],r10
	mov rax,1
	mov rdi,1
	mov rsi,digit
	mov rdx,1
	syscall
	ret
		
