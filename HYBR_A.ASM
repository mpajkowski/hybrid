	       .MODEL SMALL, C
			PUBLIC printSome

	       .DATA

	       .CODE

ShowStr		MACRO
			mov ah, 09H
			int 21H
			ENDM

AsmFun		PROC

			ret
			ENDP

			END
