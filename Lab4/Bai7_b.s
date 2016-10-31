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
COL EQU 5
	LDR R12, =arPT
	BL MAIN
	BL STOP

MAIN PROC
	PUSH {LR}
	MOV R2, #0x01 ; Bien chay
	LDR R3, =COL
	BL CHEO_PHU
	POP {LR}
	BX LR
	ENDP

CHEO_PHU PROC
	PUSH {LR}
	SUB R5, R3, #1
	LSLS R5, #2
	ADD R12, R5
	LDR R0, [R12] ; Duong cheo phu (MAX)
	LDR R1, [R12] ; Duong cheo phu (MIN)
WHILE
	ADD R12, R5
	LDR R4, [R12]
	BL TIM_MAX
	BL TIM_MIN
	ADD R2, #1
	CMP R2, R3
	BLT WHILE
	POP {LR}
	BX LR
	ENDP

TIM_MAX PROC
	PUSH {LR}
	CMP R4, R0
	BLT NEXT_MAX
	MOV R0, R4
NEXT_MAX
	POP {LR}
	BX LR
	ENDP

TIM_MIN PROC
	PUSH {LR}
	CMP R4, R1
	BGT NEXT_MIN
	MOV R1, R4
NEXT_MIN
	POP {LR}
	BX LR
	ENDP
	
STOP
	B STOP
	
	END