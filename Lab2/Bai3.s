	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler

arPT
	DCD 2,3,6,8,3,3

	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------
; TBC(arPT)
;-----------------------------------
MAX EQU 6
DU EQU 10

	MOV R0, #0x00 ; TBC, phan nguyen
	MOV R1, #0x00 ; TBC, phan thap phan
	MOV R2, #0x00 ; Bien i
	LDR R3, =arPT ; Dia chi arPT
	LDR R4, =MAX ; Bien MAX
	LDR R5, =DU

MAIN
	LDR R6, [R3] ; Gia tri arPT
	ADD R0, R6
	ADD R2, #1
	ADD R3, #4
	CMP R2, R4
	BLT MAIN
	UDIV R6, R0, R4 ; R6 = R6/R4
	MLS R1, R4, R6, R0 ; R1 = R0 - (R4*R6)
	MOV R0, R6
	CMP R1, #0
	BNE ThapPhan
NEXT
	BL STOP
	
ThapPhan
	MUL R1, R5
	UDIV R6, R1, R4
	MLS R6, R4, R6, R1
	CMP R6, #0
	BNE Cong1
	BL NEXT

Cong1
	UDIV R1, R4
	ADD R1, #1
	BL NEXT

STOP
	B STOP
	
	END