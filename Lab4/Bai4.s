	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler

arPT
	DCD 3,8,10,0,-5,1,9

	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tinh TBC(arPT)(su dung
; ham main va ham con)
;-----------------------------------------
MAX EQU 7
MUOI EQU 10
	
	LDR R2, =arPT
	BL MAIN

MAIN PROC
	MOV R0, #0x00 ; TBC, phan nguyen
	MOV R1, #0x00 ; TBC, phan thap phan
	LDR R3, =MAX
	MOV R4, #0x00
	LDR R7, =MUOI
	BL TBC
RETURN_TBC
	BL STOP
	ENDP
	
TBC PROC
	LDR R5, [R2]
	ADD R2, #4
	ADD R4, #1
	BL TONG
RETURN_TONG
	CMP R4, R3
	BLT TBC
	SDIV R0, R6, R3
	MLS R1, R3, R0, R6
	MUL R1, R7
	SDIV R1, R1, R3
	BL RETURN_TBC
	ENDP
	
TONG PROC
	ADDS R6, R5
	BL RETURN_TONG
	ENDP
	
STOP
	B STOP
	
	END