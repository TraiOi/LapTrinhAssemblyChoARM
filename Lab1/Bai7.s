	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-------------------------------------
; Tim UCLN(a,b)
;-------------------------------------
A EQU 9
B EQU 28
	MOV R1, #0x00 ; UCLN(a,b)
	LDR R2, =A ; Bien A
	LDR R3, =B ; Bien B

MAIN
	; R1 = A MOD B
	UDIV R1, R2, R3 ; R1 = int(A/B)
	MUL R4, R3, R1 ; R4 = B*R1
	SUB R1, R2, R4 ; R5 = A - (B*R1)
	; end R1
	CMP R3, #0
	MOV R2, R3
	MOV R3, R1
	BNE MAIN

STOP
	B STOP
	
	END