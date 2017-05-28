.MODEL SMALL, C
.stack			400h
.code
public calcAverage, signCounter

calcAverage PROC
initialize:
    push bp
    mov bp, sp				; sp contains input from the c++ function

    xor cx, cx
    xor bx, bx
    xor ax, ax

    mov cx, [bp+6]     		        ; Move to cs register size of float array
    mov bx, [bp+4]     		        ; Moving array's pointer to bx register

    finit 				; Initialize FPU
    fldz 				; Load 0.0 to the top of the stack
    
    jcxz finish

loop1:
    fadd DWORD PTR [bx] ; Sum'em all!
    add bx, 4 				; Moves to next float value in array (every float needs 4 bytes of space)
    loop loop1

divination:
    fidiv WORD PTR [bp+6]

finish:
    pop bp
    ret

calcAverage ENDP

;==========================================================================;

signCounter PROC
_initialize:
    push bp
    mov bp, sp        	   		; sp contains input from the c++ function

    xor ax, ax
    xor bx, bx
    xor si, si

    mov al, [bp+6] 			; Moving sign to al register

    xor bx, bx
    mov bx, [bp+4] 			; Moving array's pointer to bx register

_loop:
    cmp BYTE PTR [bx], 00h 		; if it's end of the char array, end/skip loop
    je _finish    	

    cmp [bx], al			; compare char elements
    jne _iterate			; if isn't equal, skips to _iterate
		
    inc si				; if is equal, increase si

_iterate:				; increases bx register by 1 and continues loop
    inc bx
    jmp _loop

_finish:
    xor al,al
    mov ax,si

    pop bp
    ret

signCounter	ENDP
END
