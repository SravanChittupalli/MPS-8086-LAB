.model small
.data
		R DT 4.2  		;radius of sphere
		MULTIPLIER DD 1.33  	;4/3 constant
		volume DD ?
.code
.startup	
		MOV AX,@data
		MOV DS, AX
		FLD R			;load radius in stack
		FST ST(4)		;copy to st4
		FMUL ST(0), ST(0)	;r^2
		FMUL ST(0), ST(4)	;r^2 * r = r^3
		FLD ST(1)		;shift this to st1 i.e r^3 
		FLD MULTIPLIER  	;This will load at st0
		FMUL ST(0), ST(2) 	;multiply r^3 with 4/3
		FST ST(1)
		FLDPI       		;multiply ST(0) with Pi
		FMUL ST(0), ST(1)
		FST volume
		mov ah, 4ch
		int 21h

END