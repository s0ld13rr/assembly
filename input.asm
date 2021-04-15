format PE64 Console 5.0
entry main

include 'win64a.inc'

section '.data' data readable writeable
; variables
	a dq ?
	b dq ?
	c dq ?

section '.text' code readable executable
main:
	cinvoke printf, "Enter num: "
	cinvoke scanf, "%d", a

	cinvoke printf, "Enter second num: "
	cinvoke scanf, "%d", b

	mov rax, [a]
	mov rbx, [b]
	add rbx, rax
	mov [c], rbx
	
	cinvoke printf, "Result of addition: %d", [c] 
	
	invoke ExitProcess, 0

section '.idata' import data readable
	library msvcrt, 'MSVCRT.DLL',\
			kernel, 'KERNEL32.DLL'

	import kernel,\
		ExitProcess, 'ExitProcess'

	import msvcrt,\
		printf, 'printf',\
		scanf, 'scanf'