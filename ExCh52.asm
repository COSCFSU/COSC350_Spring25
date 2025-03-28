; Testing Colors	(colors.asm)

; Testing SetTextColor and GetTextColor.

INCLUDE Irvine32.inc

.data
str1 BYTE "Sample string, in color",0dh,0ah,0
arrayD     DWORD 1000h,2000h,3000h
prompt1    BYTE "Enter a 32-bit signed integer: ",0
dwordVal   DWORD ?

caption db "Dialog Title", 0 

HelloMsg BYTE "This is a pop-up message box.", 0dh,0ah 
	    BYTE "Click OK to continue...", 0 

.code
main PROC

	mov	ax,red + (cyan * 16)
	call	SetTextColor
	
	mov	edx,OFFSET str1
	call	WriteString
	
	call	GetTextColor
	call	DumpRegs

	mov eax, 42h
	call	WriteHex
	call	Crlf
	call	WriteBin

	; Display the array using DumpMem.
	mov	esi,OFFSET arrayD	; starting OFFSET
	mov	ecx,LENGTHOF arrayD	; number of units in dwordVal
	mov	ebx,TYPE arrayD	; size of a doubleword
	call	DumpMem			; display memory
	call	Crlf				; new line

	call WaitMsg

	mov	ebx,0				; no caption
	mov	edx,OFFSET HelloMsg		; contents
	call	MsgBox

	mov	ebx,OFFSET caption		; caption
	mov	edx,OFFSET HelloMsg		; contents
	call	MsgBox

	exit
main ENDP

END main