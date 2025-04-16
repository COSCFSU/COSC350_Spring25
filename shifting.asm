 INCLUDE Irvine32.inc


.data


.code
main proc
	mov ah, 11110000b
	mov al, 11110000b
	mov ebx, 0aabbccddh
	;shl ah, 3
	;shr al, 2
	;shl ebx, 4
	;shl ebx, 8
	mov ebx, 0aabbccddh
	mov ecx, 0aabbccddh
	ror ebx, 8
	rcr ecx, 4
	rcl ebx, 1
	rcl ebx, 1
	rcl ebx, 1
	rcl ebx, 1

	; 16-bit date format that we made up
	; 4 bits for month, 5 bits for day, 7 bits for year
	mov ebx, 9bcde123h; our date in this strange format

	; isolate just the month
	mov ax, bx
	and ax, 0f000h
	shr ax, 12

	; isolate just the day
	mov ax, bx
	and ax, 0f80h
	shr ax, 7

	invoke ExitProcess,0
main endp
end main