; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
value2 DWORD 'B' ; B is cool
value3 BYTE 9
value1 BYTE 'A'	; my comment is cool


.code
main proc
	mov	eax,5				
	sub	eax,value2				

	invoke ExitProcess,0
main endp
end main