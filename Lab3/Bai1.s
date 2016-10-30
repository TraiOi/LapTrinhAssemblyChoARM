	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tinh tong cac so <= N
; (su dung chuong trinh con va stack)
;-----------------------------------------
N EQU 10
	MOV R0, #0x00 ; Tong
	LDR R1, =N 
	MOV R2, #0x00 ; Bien chay 
	
MAIN
	ADD R2, #1
	PUSH {R2}
	BL TINHTONG
	CMP R2, R1
	BLT MAIN
	BL STOP
	
TINHTONG PROC
	POP {R2}
	ADD R0, R2
	BX LR
	ENDP

STOP
	B STOP
	
	END