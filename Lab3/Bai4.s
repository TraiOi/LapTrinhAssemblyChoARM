	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tinh tong cac so <= N 
; va %5==0 (su dung chuong trinh con va 
; stack)
;-----------------------------------------
N EQU 15
NAM EQU 5
	MOV R0, #0x00 ; Tong
	LDR R1, =N 
	MOV R2, #0x00 ; Bien chay
	LDR R3, =NAM
	
MAIN
	ADD R2, #1
	PUSH {R2}
	BL CHECK
RETURN_CHECK
	POP {R4}
	CBNZ R4, TONG
RETURN_TONG
	CMP R2, R1
	BLT MAIN
	BL STOP
	
TONG PROC
	ADD R0, R2
	BL RETURN_TONG
	ENDP

CHECK PROC
	POP {R2}
	SDIV R4, R2, R3
	MLS R4, R3, R4, R2
	CBZ R4, RETURN_1
	MOV R4, #0x00
	BL NEXT_CHECK
RETURN_1
	MOV R4, #0x01
NEXT_CHECK
	PUSH {R4}
	BL RETURN_CHECK
	ENDP

STOP
	B STOP
	
	END