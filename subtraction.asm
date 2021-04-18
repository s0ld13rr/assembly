format PE64 Console 5.0
entry main

include 'win64a.inc'

section '.data' readable writeable
	numberOne dq ?
	numberTwo dq ?
section '.text' readable executable
main:
	; code..
	cinvoke printf, 'Enter num: ' 
	cinvoke scanf, "%d", numberOne

	cinvoke printf, 'Enter second num: '
	cinvoke scanf, "%d", numberTwo

	; Substraction 
	mov rax, [numberOne]
	mov rbx, [numberTwo]
	sub rbx, rax
	; Result output
	cinvoke printf, "Result of sub: %d", rbx
	invoke ExitProcess, 0 
section '.idata'import data readable 
	library msvcrt, 'MSVCRT.DLL',\
			kernel, 'KERNEL32.DLL'

	import kernel,\
		   ExitProcess, 'ExitProcess'
	import msvcrt,\
			printf, 'printf',\
			scanf, 'scanf'
