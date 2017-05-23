	       .MODEL SMALL, C
			PUBLIC printSome

	       .DATA

testMsg	db	"TextXD",10,13,'$'

	       .CODE

ShowStr		MACRO
			mov ah, 09H
			int 21H
			ENDM

printSome	PROC
			lea dx, testMsg
			ShowStr
			ret
			ENDP

			END
