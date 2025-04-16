 INCLUDE Irvine32.inc

mDemo MACRO val
	mov eax, val	
ENDM

mPrintln MACRO txt
	LOCAL str
	.data
		str BYTE txt
	.code
		push edx
		mov edx, OFFSET str
		call WriteString
		pop edx
ENDM

COORD STRUCT
	X WORD ?
	Y WORD ?
COORD ENDS

Student STRUCT
	sname BYTE 9 dup("0") ; 9
	ALIGN DWORD
	sid	BYTE 5 dup("0")	; 5
	ALIGN DWORD
	smajor BYTE 10 dup("0") ; 10
	ALIGN DWORD
	syear DWORD 0 ; 4
	sgpa DWORD 0 ; 4
Student ENDS

.data
	point COORD <1, 2>
	stu1 Student <"Stue", "123", "Comp", 3, 4>

.code
main proc
	
	mov eax, TYPE Student
	mov ebx, SIZE Student
	mov ecx, SIZE stu1
	mov edx, stu1.syear


	;mDemo 9
	;mPrintln "Hello World!"

	invoke ExitProcess,0
main endp
end main