	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler

arPT
	DCD -6, 9, 3,27, 3
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
;
;-----------------------------------------
MAX EQU 5
	LDR R12, =arPT
	BL MAIN
	BL STOP

MAIN PROC
	PUSH {LR}
	MOV R0, #0x00 ; UCLN
	MOV R1, #0x01 ; Bien chay
	LDR R2, =MAX
	BL UCLN_CHUOI
	POP {LR}
	BX LR
	ENDP

UCLN_CHUOI PROC
	PUSH {LR}
	LDR R0, [R12]
WHILE_1
	ADD R12, #4
	LDR R4, [R12]
	CMP R0, R4
	BGT NEXT_1
	BL HOAN_VI
NEXT_1
	BL UCLN
	ADD R1, #1
	CMP R1, R2
	BLT WHILE_1
	POP {LR}
	BX LR
	ENDP

UCLN PROC
	PUSH {LR}
WHILE_2
	SDIV R5, R0, R4
	MLS R5, R5, R4, R0
	CMP R4, #0
	BEQ NEXT_2
	MOV R0, R4
	MOV R4, R5
	BL WHILE_2
NEXT_2
	POP {LR}
	BX LR
	ENDP

HOAN_VI PROC
	PUSH {LR}
	PUSH {R0}
	PUSH {R4}
	POP {R0, R4}
	POP {LR}
	BX LR
	ENDP
	
STOP
	B STOP
	
	END