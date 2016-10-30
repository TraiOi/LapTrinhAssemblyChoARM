	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	
arMatran
	DCD  4, 6, 8,-1, 4,-2
	DCD  5,-5,-7, 9,-1, 0
	DCD -3,11,-9, 8, 0,-4
	DCD  5, 5, 5, 5, 5,-1
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Dem so phan tu am, duong trong ma tran
;-----------------------------------------
MAX EQU 24
	MOV R0, #0x00 ; So phan tu duong
	MOV R1, #0x00 ; So phan tu am
	MOV R2, #0x00 ; Bien chay
	LDR R3, =arMatran  ; Dia chi phan tu hien tai
	LDR R4, =MAX

MAIN
	LDR R5, [R3]  ; Gia tri phan tu hien tai
	CBZ R5, NEXT  ; Bo qua neu R5 = 0
	LSLS R5, #1   ; Dich MSB vao C-flag
	MRS R5, APSR  ; Gan C-flag vao R5
	CBNZ R5, SO_AM
	ADD R0, #1 ; So duong
	BL NEXT
SO_AM
	ADD R1, #1 ; So am
NEXT
	ADD R2, #1
	ADD R3, #4
	CMP R2, R4
	BLT MAIN

STOP
	B STOP
	
	END