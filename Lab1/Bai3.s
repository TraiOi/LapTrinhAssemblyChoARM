	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler

;----------------------------------------------
; Tinh giai thua N
; ---------------------------------------------
N EQU 10
	MOV R1, #0x01 ; Giai thua N
	MOV R2, #0x01 ; Bien i
	LDR R3, =N ; Bien N

MAIN
	MUL R1, R2
	ADD R2, #1
	CMP R2, R3
	BLT MAIN

STOP
	B STOP
	
	END