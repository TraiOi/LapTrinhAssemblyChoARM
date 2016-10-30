	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler

arPT
	DCD 7,3,6,4,3,1
	DCD 3,4,1,7,9,9
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;------------------------------------------
; Tinh tong trong ma tran
;------------------------------------------
MAX EQU 12
	MOV R0, #0x00 ; Tong
	MOV R1, #0x00 ; Bien i
	LDR R2, =arPT ; Dia chi arPT
	LDR R3, =MAX ; Bien MAX

MAIN
	LDR R4, [R2]
	ADD R0, R4
	ADD R1, #1
	ADD R2, #4
	CMP R1, R3
	BLT MAIN
	
STOP
	B STOP
	
	END
	