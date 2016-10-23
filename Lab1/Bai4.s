	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler

;--------------------------------------------
; Tong cac so <= N va chia het cho 5
;--------------------------------------------
N EQU 20
	MOV R1, #0x00 ; Tong N
	MOV R2, #0x00 ; Bien i
	MOV R4, #5;
	LDR R3, =N ; Bien N

MAIN
	ADD R2, #1
	; Modulo, R5 = R2 % R4
	UDIV R5, R2, R4 ; R5 = int(R2 / R4)
	MUL R6, R4, R5 ; R6 = tmp = (R4 * R5)
	SUB R5, R2, R6 ; R5 = R2 - R6 = R2 - (R4 * R5)
	; End modulo
	CMP R5, #0
	BNE MAIN
	ADD R1, R2
	CMP R2, R3
	BLT MAIN
		
STOP
	B STOP
	
	END
