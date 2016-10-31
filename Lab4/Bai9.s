	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler

arPT
	DCD -3, 8,10, 0, 2
	DCD  4, 6, 7, 8, 2
	DCD  5, 7,-9, 3, 2
	DCD -4, 5, 6,10, 2
	DCD  3, 5, 1, 2,20
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
;
;-----------------------------------------
MAX EQU 5*5
NAM EQU 5
	LDR R12, =arPT
	BL MAIN
	BL STOP

MAIN PROC
	PUSH {LR}
	MOV R0, #0x00 ; Tong chan
	LDR R1, =NAM
	MOV R2, #0x00 ; Bien chay
	LDR R3, =MAX
	BL TONG_CHIA_5
	POP {LR}
	BX LR
	ENDP

TONG_CHIA_5 PROC
	PUSH {LR}
WHILE
	LDR R4, [R12]
	SDIV R5, R4, R1
	MLS R5, R1, R5, R4
	CBNZ R5, NEXT
	ADDS R0, R4
NEXT
	ADD R12, #4
	ADD R2, #1
	CMP R2, R3
	BLT WHILE
	POP {LR}
	BX LR
	ENDP
	
STOP
	B STOP
	
	END