	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;--------------------------------
; Kiem tra tinh chan le cua 1 so
; co su dung ham con
;--------------------------------
A EQU -42321
	LDR R0, =A ; Bien A

MAIN
	BL CHECK
	BL STOP
	
; Ham kiem tra tinh chan le cua A
; Tra ve R1 = 1 neu A la so chan
; Tra ve R1 = 0 neu A la so le
CHECK PROC
	LSRS R0, #1 ; Dich bit LSB vao C-flag
	MRS R1, APSR ; Dua APSR vao R1
	CMP R1, 0x20000000 ; So sanh R1 voi C-flag
	BEQ RETURN_0
	MOV R1, #1 ; Tra ve 1 neu C-flag = 0
	BX LR
RETURN_0
	MOV R1, #0 ; Tra ve 0 neu C-flag = 1
	BX LR
	ENDP
	
STOP
	B STOP
	
	END