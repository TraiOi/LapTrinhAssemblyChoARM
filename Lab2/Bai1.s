	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN

arPT 
	DCD 6,4,2,1,5

	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;---------------------------------------------
; Tinh tong cac phan tu trong chuoi so
;---------------------------------------------
MAX EQU 5

	MOV R1, #0x00 ; Tong
	MOV R2, #0x00 ; Bien i
	LDR R3, =arPT ; Dia chi arPT
	LDR R4, =MAX ; MAX
	MOV R5, #0x00 ; Gia tri arPT

MAIN
	LDR R5, [R3]
	ADD R1, R5
	ADD R2, #1
	ADD R3, #4
	CMP R2, R4
	BLT MAIN
	
STOP
	B STOP
	
	END