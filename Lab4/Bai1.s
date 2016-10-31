	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler

arPT
	DCD 3,5,1,6,8,-1
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tinh tong cac phan tu
; trong chuoi so (su dung ham main va ham
; con)
;-----------------------------------------
MAX EQU 6

	BL MAIN

MAIN PROC
	MOV R0, #0x00 ; Tong
	MOV R1, #0x00 ; Bien chay
	LDR R2, =arPT
	LDR R3, =MAX
WHILE
	ADD R1, #1
	BL TONG
RETURN_TONG
	ADD R2, #4
	CMP R1, R3
	BLT WHILE
	BL STOP
	ENDP

TONG PROC
	LDR R4, [R2]
	ADD R0, R4
	BL RETURN_TONG
	ENDP
	
STOP
	B STOP
	
	END