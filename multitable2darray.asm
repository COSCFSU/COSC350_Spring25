; Examples with 2D Arrays
; Special thanks to Kobe for having his notes

INCLUDE Irvine32.inc

.data
len = 13
mtable	DWORD (len * len) DUP(?)

.code
main proc
	mov esi, OFFSET mtable ; yes, we will incr this...

	; some kinda nested loop goes here
	mov ecx, len
	L_OUTER:
		mov eax, 0 ; accumulator
		mov ebx, len
		sub ebx, ecx
		push ecx ; save the outer loop (row) counter
		mov ecx, len ; again, but for inner loop
		L_INNER:
			mov [esi], eax
			add eax, ebx
			add esi, TYPE mtable ; move forward in array
			loop L_INNER
		pop ecx
		loop L_OUTER

	invoke ExitProcess,0
main endp
end main