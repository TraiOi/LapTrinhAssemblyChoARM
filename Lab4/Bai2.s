	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tim UCLN(a,b) (su dung
;ham main va ham con)
;-----------------------------------------
SO_A EQU 14
SO_B EQU -4

	BL MAIN

MAIN PROC
	MOV R0, #0x00 ; UCLN
	LDR R1, =SO_A
	LDR R2, =SO_B
	CMP R1, R2
	BLT HOAN_VI
RETURN_HOAN_VI
	BL UCLN
RETURN_UCLN
	BL STOP
	ENDP
	
HOAN_VI PROC
	PUSH {R1}
	PUSH {R2}
	POP {R1, R2}
	BL RETURN_HOAN_VI
	ENDP

UCLN PROC
	SDIV R0, R1, R2
	MLS R0, R2, R0, R1
	CMP R2, #0
	MOV R1, R2
	MOV R2, R0
	BNE UCLN
	BL RETURN_UCLN
	ENDP
	
STOP
	B STOP
	
	END