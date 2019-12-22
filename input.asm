%macro print 2
	mov rax,1
	mov rdi,1
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro



section .data
	msg1: db "Enter the digit: "
	len1: equ $ - msg1
	msg2: db "digit = "
	len2: equ $ - msg2
	newline: db 10
	
	
section .bss
	number: resb 2
	
section .text
	global _start
	_start:
	
		print msg1,len1
		
		mov rax,0
	 	mov rdi,0
		mov rsi,number
		mov rdx,2
		syscall
		
		print msg2,len2
		
		print number,2
		print newline,1
		
		mov rax,60
		mov rdi,0
		syscall
		
		
	

	

