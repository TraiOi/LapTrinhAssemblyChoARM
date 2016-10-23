	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler

;------------------------------------------------
; Tinh tong chan le <= N
;------------------------------------------------
N equ 10
	MOV R1, #0x00 ; Tong so chan
	MOV R2, #0x00 ; Tong so le
	MOV R3, #0x01 ; Bien i
	LDR R4, =N ; Bien N

MAIN
	; Tong le
	ADD R2, R3
	ADD R3, #1
	; Tong chan
	ADD R1, R3
	ADD R3, #1
	CMP R3, R4
	BLT MAIN	
	
STOP
	B STOP
	
	END