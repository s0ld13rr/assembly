format PE64 Console 5.0 ; Program format, 64 bit EXE
entry main ; defining entrypoint main

include 'win64a.inc' ; using win64a.inc 

section '.text' code readable executable ; code section 

main:
  cinvoke printf, <"%s", 10>, message ; printing message
  cinvoke getchar ; getchar 
  invoke ExitProcess, 0 ; exit with status 0

section '.data' data readable writeable ; data section
  message db 'Hello, World!', 0 ; message variable, db - define byte

section '.idata' import data readable ; import libs from win64 

  library msvcrt, 'MSVCRT.DLL',\
        kernel, 'KERNEL32.DLL'

  import kernel,\
      ExitProcess, 'ExitProcess'

  import msvcrt,\
      printf, 'printf',\
      getchar, 'getchar'