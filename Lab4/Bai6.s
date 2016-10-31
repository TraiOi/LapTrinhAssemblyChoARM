	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler

arPT
	DCD -3, 8,10, 0
	DCD  4, 6, 7, 8
	DCD  5, 7,-9, 3
	DCD -4, 5, 6,10
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
;
;-----------------------------------------
MAX EQU 4*4
	LDR R12, =arPT
	BL MAIN
	BL STOP

MAIN PROC
	PUSH {LR}
	MOV R0, #0x00 ; So phan tu duong
	MOV R1, #0x00 ; So phan tu am
	MOV R2, #0x00 ; Bien chay
	LDR R3, =MAX
WHILE_MAIN
	LDR R4, [R12]
	BL DUONG_AM
	ADD R2, #1
	ADD R12, #4
	CMP R2, R3
	BLT WHILE_MAIN
	POP {LR}
	BX LR
	ENDP

DUONG_AM PROC
	MOV R5, #0x00
	PUSH {LR}
	CBZ R4, NEXT ; Bo qua neu bang 0
	MSR APSR, R5 ; Clear flag
	LSLS R4, #1  ; Dich MSB vao C-flag
	MRS R4, APSR 
	CBZ R4, DUONG
	ADD R1, #1
	BL NEXT
DUONG
	ADD R0, #1
NEXT
	POP {LR}
	BX LR
	ENDP

STOP
	B STOP
	
	END