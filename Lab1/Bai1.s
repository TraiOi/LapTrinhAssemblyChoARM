; Khai bao doan du lieu
	AREA RESET, DATA, READONLY
		DCD 0x20001000	; Stack pointer value when stack is empty
		DCD Reset_Handler ; Reset vector
	ALIGN
	
; Khai bao doan ma lenh
	AREA MYCODE, CODE, READONLY
		ENTRY ; Khai bao diem vao chuong trinh
		EXPORT Reset_Handler
Reset_Handler

;-----------------------------------------------------------
; Tinh tong <= N
;-----------------------------------------------------------
N equ 10
	MOV R0, #0x00 ; Tong
	MOV R1, #0x01 ; Bien i
	LDR R2, =N; Bien N
MAIN
	ADD R0, R1
	ADD R1, #1
	CMP R1, R2
	BLT MAIN

STOP 
	B STOP
	
	END