	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler

arPT
	DCD 6,4,2,5,8,9
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;--------------------------------------
; Tim min(arPT), max(arPT)
;--------------------------------------
MAX EQU 6
	LDR R3, =arPT ; Dia chi arPT
	LDR R0, [R3] ; Min
	LDR R1, [R3] ; Max
	MOV R2, #0x00 ; Bien i
	LDR R4, =MAX ; bien MAX
	MOV R5, #0x00 ; Gia tri arPT

MAIN
	LDR R5, [R3]
	CMP R5, R0
	BLT MINNUM
	CMP R5, R1
	BGT MAXNUM
NEXT
	ADD R2, #1
	ADD R3, #4
	CMP R2, R4
	BLT MAIN
	BL STOP
	
MINNUM
	MOV R0, R5
	BL NEXT
	
MAXNUM
	MOV R1, R5
	BL NEXT
	
STOP
	B STOP
	
	END