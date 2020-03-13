%include "TextConversion.asm"

%macro print 2
	mov rax,01
	mov rdi,01
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro
 
 %macro read 2
	mov rax,00
	mov rdi,00
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro


section .data
	arr: db 3,5,10,0,0

section .bss
	outAscii: resb 16
	inAscii: resb 16

section .text
	global _start
	_start:

	mov rsi,arr
	mov rcx,5h
	xor rax,rax
	loop1:
		add al,byte[rsi]
		inc rsi
		dec rcx
		jnz loop1

	call _HexToAscii
	print outAscii,4

	mov rax,60
	mov rdi,00
	syscall