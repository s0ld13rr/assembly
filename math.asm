format PE64 Console 5.0
entry main

include 'win64a.inc'

section '.data' data readable writeable
	a dq 10
	b dq 30

section '.text' code readable executable 
main:
	mov rax, [a]
	mov rbx, [b]
	add rbx, rax
	cinvoke printf, <"%d">, rbx
	invoke ExitProcess, 0

section '.idata'import data readable 
	library msvcrt, 'MSVCRT.DLL',\
			kernel, 'KERNEL32.DLL'

	import kernel,\
		   ExitProcess, 'ExitProcess'
	import msvcrt,\
			printf, 'printf'