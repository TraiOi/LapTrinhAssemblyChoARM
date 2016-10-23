	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;----------------------------------------
; Tim BCNN(a,b)
;----------------------------------------
A EQU 4
B EQU 6
	MOV R1, #0x00 ; BCNN(a,b)
	MOV R2, #0x00 ; UCLN(a,b)
	LDR R3, =A ; Bien A
	LDR R4, =B ; Bien B
	MOV R5, R3 ; tmp bien A
	MOV R6, R4 ; tmp bien B

MAIN
	; R2 = R5 MOD R6
	UDIV R2, R5, R6
	MUL R7, R6, R2
	SUB R2, R5, R7
	; End R2
	CMP R6, #0
	MOV R5, R6
	MOV R6, R2
	BNE MAIN
	MUL R3, R4
	UDIV R1, R3, R2

STOP
	B STOP
	
	END