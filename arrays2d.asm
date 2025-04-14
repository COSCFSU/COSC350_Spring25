; Examples with 2D Arrays
; Special thanks to Kobe for having his notes

INCLUDE Irvine32.inc

.data
len = 3
ttt1	BYTE 1, 2, 3, 4, 5, 6, 7, 8, 9

ttt2	BYTE 1, 2, 3
		BYTE 4, 5, 6
		BYTE 7, 8, 9

ttt3	BYTE 1, 2, 3,
			 4, 5, 6,
			 7, 8, 9

arrdw	DWORD 1, 2, 3, 4

.code
main proc
	; syntax examples
	mov ah, ttt1[3]
	mov bh, ttt2[3]
	mov al, ttt1[12] ; 4, but from the NEXT ARRAY
	mov ch, ttt1[(len * 1) + 0] ; the 4 (bad luck!)
	mov cl, ttt1[(len * 2) + 1]; the 8 (good luck!)
	; that means, the proper syntax is
	;	array[(size * row) + array_offset]


	;mov ebx, arrdw[3] ; weird syntax...


	; column example - put a column in a, b, and c regs
	mov dh, 0 ; row
	mov dl, 0 ; col
	mov al, ttt1[(len * dh) + dl]
	mov dh, 1 ; row
	mov dl, 0 ; col
	mov bl, ttt1[(len * dh) + dl]
	mov dh, 2 ; row
	mov dl, 0 ; col
	mov cl, ttt1[(len * dh) + dl]


	invoke ExitProcess,0
main endp
end main