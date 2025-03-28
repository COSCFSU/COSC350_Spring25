; Paramaters, local memory, procedures 2.0
; Mar 28 Examples

; Special thanks to Jay, JimmyQ, Michael, Cole, Ben


.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

.code
main proc
	;mov eax, 0
	;call aProc	

	;mov ebx, 0
	;push ebx
	;call aRecurse

	push 6
	push 5
	call myAdd

	invoke ExitProcess,0
main endp

; precond: x and y on stack
; postcond: eax contains x + y
myAdd proc
	push ebp
	mov ebp, esp
	pushad

	; get the params (6 and 5)
	mov eax, [ebp + 12]
	mov ebx, [ebp + 8]

	; set up local variabls x and y
	sub esp, 12
	mov DWORD PTR [ebp - 4], ebx ; y
	mov DWORD PTR [ebp - 8], eax ; x
	add eax, ebx
	mov DWORD PTR [ebp - 12], eax; r = x + y
	add esp, 12
	popad ; this is exactly why i said never to use this
	mov esp, ebp
	pop ebp
	ret
myAdd endp

; precond: parameter n on the stack
; postcond: none
aRecurse proc
	push ebp
	mov ebp, esp
	; base - if n == 10, stop
	mov ebx, [ebp + 8]
	cmp ebx, 10
	je L_theEnd

	; recurse - otherwise, keep going
	inc ebx
	push ebx ; aka aRecurse(n)
	call aRecurse

L_theEnd:
	mov esp, ebp
	pop ebp
	ret
aRecurse endp

aProc proc
	push ebp
	mov ebp, esp ; set the new base to the old top
	push eax
	mov eax, 'a'
	call bProc


	pop eax
	mov esp, ebp
	pop ebp
	ret
aProc endp

bProc proc
	push ebp
	mov ebp, esp
	push eax
	mov eax, 'b'
	call cProc

	pop eax
	mov esp, ebp
	pop ebp
	ret
bProc endp

cProc proc
	push ebp
	mov ebp, esp
	push eax
	mov eax, 'c'

	pop eax
	mov esp, ebp
	pop ebp
	ret
cProc endp
end main