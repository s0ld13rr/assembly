format PE64 Console 5.0
entry main

include 'win64a.inc'

section '.data' readable writeable
	firstNum dq ?
	secondNum dq ?
section '.text' readable executable 
main:
	cinvoke printf, "First num: "
	cinvoke scanf, "%d", firstNum

	cinvoke printf, "Second num: "
	cinvoke scanf, "%d", secondNum

	; here register rax * rbx but result of mul stored in rax, that's why we printed rax's value
	mov rax, [firstNum]
	mov rbx, [secondNum] 
	mul rbx

	;output
	cinvoke printf, "Result of multiplication: %d", rax 
	invoke ExitProcess, 0

section '.idata' import data readable
	library msvcrt, 'MSVCRT.DLL',\
			kernel, 'KERNEL32.DLL'

	import msvcrt,\
			printf, 'printf',\
			scanf, 'scanf'

	import kernel,\
			ExitProcess, 'ExitProcess'