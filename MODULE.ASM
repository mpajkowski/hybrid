.MODEL SMALL, C
.stack			400h
.code
public calcAverage, signCounter

calcAverage PROC NEAR

initialize:
    push bp
    mov bp,sp      	    ; SP contains input from the c++ function

    xor bx, bx
	xor ax, ax
	xor si, si

    mov si, [bp+6] 				; Moving amount of typed values to si register

	xor bx, bx
    mov bx, [bp+4] 			; Moving array's pointer to bx register

    xor dx, dx
    xor di, di

loop1:
	cmp di, si  			; Comparing loop counter to amount of typed values, if equal or above, program ends/skips loop and moves to divination
	jae	finish 
    jmp addition

addition:					; Sum'em all!
    mov dx, [bx]
    add ax, dx

	inc di
    add bx, 2					
	jmp loop1

finish:
	xor dx, dx		
	xor bx, bx

	mov bx, si
	idiv bx

    pop bp
    ret

calcAverage ENDP

;==========================================================================;

signCounter PROC NEAR

_initialize:
    push bp
    mov bp, sp        	    ; SP contains input from the c++ function

	xor ax, ax
	xor bx, bx
	xor si, si

	mov al, [bp+6] 			; Moving sign to al register


	xor bx, bx
	mov bx, [bp+4] 			; Moving array's pointer to bx register

_loop:
	cmp BYTE PTR [bx], 00h 	; if it's end of the char array, end/skip loop
	je	_finish    	

	cmp [bx], al			; compare char elements
	je _IsEqual     
	jne _isDone

_IsEqual:					; if is equal, increase si
	inc si			
	jmp _isDone

_isDone:					; if not, jump here and continue
	inc bx
	jmp _loop

_finish:
	xor al,al
	mov ax,si

    pop bp
    ret

signCounter	ENDP
END