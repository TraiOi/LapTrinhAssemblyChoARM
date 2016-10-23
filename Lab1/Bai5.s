	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-------------------------------------------
; Tinh x^n
;-------------------------------------------
N EQU 10
X EQU 2
	LDR R1, =X ; x^n
	MOV R2, #0x01 ; Bien i
	LDR R3, =N ; Bien N
	LDR R4, =X ; Bien X

MAIN
	MUL R1, R4
	ADD R2, #1
	CMP R2, R3
	BLT MAIN

STOP
	B STOP
	
	END