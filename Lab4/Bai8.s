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
	LDR R12, =arPT
	BL MAIN
	BL STOP

MAIN PROC
	PUSH {LR}
	MOV R0, #0x00 ; Tong chan
	MOV R1, #0x00 ; Tong le
	MOV R2, #0x00 ; Bien chay
	LDR R3, =MAX
	BL CHAN_LE
	POP {LR}
	BX LR
	ENDP

CHAN_LE PROC
	PUSH {LR}
WHILE
	MOV R5, #0x00
	LDR R4, [R12]
	MSR APSR, R5
	LSRS R5, R4, #1
	MRS R5, APSR
	CBZ R5, CHAN
	ADDS R1, R4
	BL NEXT
CHAN
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