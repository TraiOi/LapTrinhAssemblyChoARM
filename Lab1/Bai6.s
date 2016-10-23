	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;--------------------------------------
; Tinh tong 1 + x + x^2 + x^3 + .. + x^n
;--------------------------------------
N EQU 4
X EQU 2
	MOV R1, #0x01; 1 + x + x^2 + x^3 + .. + x^n
	MOV R2, #0x01 ; Bien i
	LDR R4, =N ; Bien N
	LDR R5, =X ; Bien X
	
	ADD R1, R5
MAIN
	LDR R6, =X ; x^i
	MOV R3, #0x00 ; Bien j
XmuI
	MUL R6, R5
	ADD R3, #1
	CMP R3, R2
	BLT XmuI
	ADD R1, R6
	ADD R2, #1
	CMP R2, R4
	BLT MAIN

STOP
	B STOP
	
	END