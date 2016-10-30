	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tim UCLN(a,b) (su dung
; chuong trinh con va stack)
;-----------------------------------------
SO_A EQU 18
SO_B EQU 84
	MOV R0, #0x00 ; UCLN
	LDR R1, =SO_A
	LDR R2, =SO_B 
	
MAIN
	CMP R1, R2
	BLT HOAN_VI
HOAN_VI
	MOV R3, R1
	MOV R1, R2
	MOV R2, R3
	PUSH {R1, R2}
	BL UCLN
	CMP R2, #0 
	POP {R1, R2}
	BNE MAIN
	BL STOP

UCLN PROC
	POP {R1, R2}
	SDIV R0, R1, R2
	MLS R0, R0, R2, R1
	PUSH {R2, R0}
	MOV PC, LR
	ENDP

STOP
	B STOP
	
	END