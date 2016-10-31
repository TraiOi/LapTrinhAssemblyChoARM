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
; Viet chuong trinh tim gia tri lon nhat,
; nho nhat trong chuoi so (su dung ham 
; main va ham con)
;-----------------------------------------
MAX EQU 7
	
	LDR R2, =arPT
	BL MAIN

MAIN PROC
	LDR R0, [R2] ; MAX
	LDR R1, [R2] ; MIN
	LDR R3, =MAX
	MOV R4, #0x01
WHILE_MAIN
	ADD R2, #4
	ADD R4, #1
	LDR R5, [R2]
	BL MIN_MAX
RETURN_MIN_MAX
	CMP R4, R3
	BLT WHILE_MAIN
	BL STOP
	ENDP
	
MIN_MAX PROC
	CMP R5, R0
	BGT SO_MAX
	CMP R5, R1
	BLT SO_MIN
	BL RETURN_MIN_MAX
SO_MIN
	MOV R1, R5
	BL RETURN_MIN_MAX
SO_MAX
	MOV R0, R5
	BL RETURN_MIN_MAX
	ENDP
	
STOP
	B STOP
	
	END