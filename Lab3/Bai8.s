	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tim BCNN(a,b) (su dung
; chuong trinh con va stack)
;-----------------------------------------
SO_A EQU 21
SO_B EQU 6
	MOV R0, #0x00 ; BCNN
	LDR R1, =SO_A
	LDR R2, =SO_B 
	
	PUSH {R1, R2}
MAIN
	CMP R1, R2
	BLT HOAN_VI
HOAN_VI
	MOV R3, R1
	MOV R1, R2
	MOV R2, R3
	PUSH {R1, R2}
	BL UCLN
RETURN_UCLN
	CMP R2, #0 
	POP {R1, R2}
	BNE MAIN
	PUSH {R0}
	BL BCNN
RETURN_BCNN
	POP {R0}
	BL STOP

UCLN PROC
	POP {R1, R2}
	SDIV R0, R1, R2
	MLS R0, R0, R2, R1
	PUSH {R2, R0}
	BL RETURN_UCLN
	ENDP

BCNN PROC
	POP {R0}
	POP {R1, R2}
	MUL R1, R2
	SDIV R1, R0
	PUSH {R1}
	BL RETURN_BCNN
	ENDP

STOP
	B STOP
	
	END