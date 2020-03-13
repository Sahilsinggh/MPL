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
	arr: db 1,9,9h,14,14h,20d,-1
	newline: db 10

section .bss
	inAscii : resb 16
	outAscii: resb 16

section .text
	global _start
	_start:
	mov rsi,arr
	mov rcx,7d
begin:
	mov al,byte[rsi]
	push rcx
	push rsi
	call _HexToAscii
	print outAscii,4
	print newline,1
	pop rsi
	pop rcx
	inc rsi
	dec rcx
	jnz begin

	mov rax,60
	mov rdi,0
	syscall


