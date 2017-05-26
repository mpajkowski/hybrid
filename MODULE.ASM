.MODEL SMALL, C
.stack			400h
.code
public calcAverage, signCounter

calcAverage PROC NEAR
initialize:
    push bp
    mov bp, sp

    xor cx, cx
    xor bx, bx
    xor ax, ax

    mov cx, [bp+6]      ; Move to cs register size of float array
    mov bx, [bp+4]      ; Moving array's pointer to bx register

    finit 				; Initialize FPU
    fldz 				; Load 0.0 to the top of stack
    
	;cmp cx, 0
	;je finish
    jcxz finish

loop1:
    fadd DWORD PTR [bx] ; Sum'em all!
    add bx, 4 			; Moves to next float value in array (every float needs 4 bytes of space)
    loop loop1

divination:
    fidiv WORD PTR [bp+6]

finish:
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
    je _finish    	

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
