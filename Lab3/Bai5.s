	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tinh x^N (su dung 
; chuong trinh con va stack)
;-----------------------------------------
N EQU 10
X EQU 3
	MOV R0, #0x01 ; X^N
	LDR R1, =X
	LDR R2, =N 
	MOV R3, #0x00 ; Bien chay
	
MAIN
	ADD R3, #1
	PUSH {R1}
	BL X_MU_N
	CMP R3, R2
	BLT MAIN
	BL STOP
	
X_MU_N PROC
	POP {R1}
	MUL R0, R1
	MOV PC, LR
	ENDP

STOP
	B STOP
	
	END