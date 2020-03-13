%include "macro.asm"
%include "TextConversion.asm"


section .data
	msg: db "positive count: "
	lenMsg: equ $-msg
	msg2: db "negative count: "
	lenMsg2: equ $-msg2
	arr : db 10,15,-5,43,46,-7
	n 	: equ 6

section .bss
	inAscii	: resb 16
	outAscii: resb 16


section .text
	global _start
	_start:
	mov rsi,arr
	mov rcx,6
	mov rbx,0
	mov rdx,0

	begin:

		mov al,byte[rsi]
		add al,0h
		js negative

		positive:
		inc rbx
		jmp update1

		negative:
		inc rdx

		update1:
		add rsi,1
		dec rcx
		jnz begin

		push rdx
		push rbx


		pop rax
		call _HexToAscii
		print outAscii,4
		
		pop rax
		call _HexToAscii
		print outAscii,4

		mov rax,60
		mov rdi,00
		syscall

