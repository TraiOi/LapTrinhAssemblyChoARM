	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler

arPT
	DCD  3, 8,10, 0
	DCD  4, 6, 7, 8
	DCD  5, 7, 9, 3
	DCD -4, 5, 6,10
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
;
;-----------------------------------------
MAX EQU 4*4
	LDR R1, =arPT
	BL MAIN
	BL STOP

MAIN PROC
	PUSH {LR}
	MOV R0, #0x00 ; Tong
	MOV R2, #0x00 ; Bien chay
	LDR R3, =MAX
WHILE_MAIN
	LDR R4, [R1]
	BL TONG
	ADD R2, #1
	ADD R1, #4
	CMP R2, R3
	BLT WHILE_MAIN
	POP {LR}
	BX LR
	ENDP

TONG PROC
	ADD R0, R4
	BX LR
	ENDP
STOP
	B STOP
	
	END