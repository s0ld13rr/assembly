format PE64 Console 5.0
entry main

include 'win64a.inc'

section '.text' code readable executable 

main:
	cinvoke printf, <"%s", 10>, message
	cinvoke getchar
	invoke ExitProcess, 0

section '.data' data readable writeable
  message db 'Hello, World!', 0

section '.idata' import data readable

  library msvcrt, 'MSVCRT.DLL',\
  		  kernel, 'KERNEL32.DLL'

  import kernel,\
  		ExitProcess, 'ExitProcess'

  import msvcrt,\
  		printf, 'printf',\
  		getchar, 'getchar'