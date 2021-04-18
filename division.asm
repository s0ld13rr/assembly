format PE64 Console 5.0
entry main

include 'win64a.inc'

section '.data' data readable writeable
	firstNum dq ?
	secondNum dq ?
	result dq ?
	remainder dq ?
section '.text' code readable executable
main:
	cinvoke printf, "Enter first num: "
	cinvoke scanf, "%d", firstNum

	cinvoke printf, "Enter second num: "
	cinvoke scanf, "%d", secondNum

	; fucking magic
	mov rax, [firstNum]
	mov rcx, [secondNum]
	xor rdx, rdx ; clear rdx register before deletion
	div rcx ; rax/rcx
	mov [result], rax
	mov [remainder], rdx ; in assembly division implemented as integer division with remainder
	cinvoke printf, "Result of division is %d, remainder: %d", [result], [remainder]
	invoke ExitProcess, 0

section '.idata' import data readable
	library msvcrt, 'MSVCRT.DLL',\
			kernel, 'KERNEL32.DLL'

	import msvcrt,\
			printf, 'printf',\
			scanf, 'scanf'

	import kernel,\
			ExitProcess, 'ExitProcess'