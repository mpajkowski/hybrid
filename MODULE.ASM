.MODEL SMALL, C

.stack			400h
.data

Char		DB		?

.code
public calcAverage, signCounter

calcAverage PROC NEAR

;;;;;;;;-----------------------LOAD THINGS-------------------'''''''''
initialize:
    push BP
    mov BP,SP           ; SP contains input from the c++ function

    xor bx,bx
	xor ax,ax
	xor al,al
;--------------------------;
;;;========ILOSC LICZB============;;;;
    xor si, si
    mov bx, [bp+6]
    mov si, [bx] ;; dx bedzie zawierac ilosc liczb

    xor bx, bx
;;;========TABLICA==================;;;;;
    mov bx, [bp+4] ;; wskaznik do pierwszego elementu tablicy
;;=========PYNTLA====================;;;;;;;;
    xor ax, ax
    xor dx, dx
    xor di, di
 ;;;;;;;;;;;;;;;-------;;;;;;;;
loop1:
	cmp di, si
	jae	finish
    jmp addition

addition:
    mov dx, [bx]
    add ax, dx

	inc di
    inc bx
    inc bx
	jmp loop1
;;;=========KUNIEC KURWA==============;;;;;;;;;;
finish:
    pop bp
    ret

calcAverage ENDP

signCounter PROC NEAR
;;;;;;;;-----------------------LOAD THINGS-------------------'''''''''
_initialize:
    push BP
    mov BP,SP           ; SP contains input from the c++ function

	xor ax,ax
	xor al,al
	;;;;------------INITIALIZE SIGN-------------;;;;;;;;
	mov bx, [bp+6] ;znak
	mov al, [bx]
	mov Char, al

	xor ax, ax
	xor al, al
	;;;;;-----------------INITIALIZE CHAR ARRAY POINTER----------;;;;;;;;
	xor bx, bx
	mov bx, [bp+4]
	;;;-------MOVING SIGN TO VARIABLE "CHAR"---;;;;;;

	xor dx, dx
	mov al, Char
	xor si, si
;;;;;;;;;;;;;;;-------;;;;;;;;
_loop1:
	cmp BYTE PTR [bx], 00h 	; if it's end of the char array, end/skip loop
	je	_finish    	

	cmp [bx], al	; compare char elements
	je _IsEqual     
	jne _isDone
_IsEqual:			; if is equal, increase si
	inc si			
	jmp _isDone
_isDone:				; if not, jump here and continue
	inc bx
	jmp _loop1
;;;---------end;;;;
_finish:
	xor ax,ax
	mov ax,si

    pop BP
    ret
signCounter	ENDP

END
