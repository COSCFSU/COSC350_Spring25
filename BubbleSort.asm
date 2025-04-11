; Implement a Bubblesort
; Special thanks to Bryce, Cole, Michael, JQ, 
;	Kobe, et al

INCLUDE Irvine32.inc

.data
; thank you so much, Bryce!
arr DWORD	9h, 1h, 7h, 2h, 5h
arr2 DWORD	2h, 8h, 9h, 1h, 3h, 5h, 7h

.code
main PROC
	push OFFSET arr
	push LENGTHOF arr
	call bsort
	exit
main ENDP

; bsort procedure
; precond: the offset of some list is on the stack
;		and then its length
; postcond: the list is sorted
bsort PROC
	;stack stuff...
	push ebp
	mov ebp, esp

	mov esi, [ebp + 12]
	; outer loop - # of overall passes
	mov ecx, [ebp + 8]
	dec ecx ; there are n-1 bubble movements...

	; ?? Is this in the right place?
	push ecx ; we don't have enough registers!
	; The outer loop, will run n bubble passes
THEOUTERLOOP:
		; ESI contains the OFFSET of the array
		; inner loop moves bubble across the array
		; inner loop is going to be size -1
		; make comparisons
		mov eax, 0
		mov ebx, 1
	BUBBLELOOP:
		mov edx, [esi + 4 * eax]
		mov edi, [esi + 4 * ebx]
		cmp edx, edi
		jge SWAP
	AFTERCMP:
		inc eax
		inc ebx

		loop BUBBLELOOP
	loop THEOUTERLOOP

SWAP:	
	mov [esi + 4 * eax], edi
	mov [esi + 4 * ebx], edx
	jmp AFTERCMP

THE_END:
	; question: do we need to sub something?
	mov esp, ebp
	pop ebp
	ret
bsort ENDP

END main