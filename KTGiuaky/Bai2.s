	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN

arPT DCD 4 , 7, 8, 2, 6, 7, 3
	 DCD 11,22,33,44,45,91, 1
	 DCD 5 , 2, 3,99,13, 6,23

	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
; -------------------------------------------
; Tinh tong so nguyen to trong ma tran
; -------------------------------------------
MAX EQU 21
	MOV R0, #0x00 ; Tong
	MOV R1, #0x00 ; Bien i
	LDR R3, =arPT ; Dia chi arPT
	MOV R4, #0x00 ; Gia tri arPT
	LDR R5, =MAX ;

MAIN
	LDR R4, [R3]
	BL CHECK
	CBZ R6, NEXT ; Neu R6 = 0 (False) thi R4 khong la so nguyen to
	ADD R0, R4
NEXT
	ADD R1, #1
	ADD R3, #4
	CMP R1, R5
	BLT MAIN
	BL STOP

; Ham kiem tra so nguyen to
; Tra ve False neu R6 = 0
; Tra ve True neu R6 = 1
CHECK PROC
	MOV R2, #0x02 ; Bien j
	CMP R4, #1
	BEQ RETURN_0
	CMP R4, #2
	BEQ RETURN_1
CHECK_LOOP
	UDIV R6, R4, R2 ; Lay phan du cua R4
	MLS R6, R2, R6, R4 ; R6 = R4 - (R4*R6)
	CBZ R6, RETURN_0 ; Neu R6 = 0 thi tra ve 0 (False)
	ADD R2, #1
	CMP R2, R4
	BLT CHECK_LOOP	
RETURN_1
	MOV R6, #1 ; Tra ve R6 = 1 (True)
	BX LR
RETURN_0
	MOV R6, #0 ; Tra ve R6 = 0 (False)
	BX LR
	ENDP
	
STOP
	B STOP

	END
