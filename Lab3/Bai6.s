	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tinh tong 1 + x^2 + 
; x^3 + .. + x^N (su dung chuong trinh con
; va stack)
;-----------------------------------------
N EQU 10
X EQU 3
	MOV R0, #0x01 ; Tong
	MOV R1, #0x01 ; X^N
	LDR R2, =X
	LDR R3, =N 
	MOV R4, #0x01 ; Bien chay
	
MAIN
	ADD R4, #1
	PUSH {R4}
	BL TONG
RETURN_TONG
	CMP R4, R3
	BLT MAIN
	BL STOP

TONG PROC
	POP {R4}
	MOV R5, #0x00 ; Bien chay
	MOV R1, #0x01 ; X^N
WHILE
	ADD R5, #1
	BL X_MU_N
RETURN_X_MU_N
	CMP R5, R4
	BLT WHILE
	ADD R0, R1
	BL RETURN_TONG
	ENDP
	
X_MU_N PROC
	MUL R1, R2
	BL RETURN_X_MU_N
	ENDP

STOP
	B STOP
	
	END