	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tinh tong cua cac so 
; chan, le<= N (su dung chuong trinh con 
; va stack)
;-----------------------------------------
N EQU 10
HAI EQU 2
	MOV R0, #0x00 ; Tong chan
	MOV R1, #0x00 ; Tong le
	LDR R2, =N 
	MOV R3, #0x00 ; Bien chay
	LDR R4, =HAI
	
MAIN
	ADD R3, #1
	SDIV R5, R3, R4
	MLS R5, R4, R5, R3 ; R5 = R3 MOD 2
	CBZ R5, SO_CHAN
	PUSH {R1}
	BL TINHTONG
	POP {R1}
	BL NEXT
SO_CHAN
	PUSH {R0}
	BL TINHTONG
	POP {R0}
NEXT
	CMP R3, R2
	BLT MAIN
	BL STOP
	
TINHTONG PROC
	POP {R5}
	ADD R5, R3
	PUSH {R5}
	MOV PC,LR
	ENDP

STOP
	B STOP
	
	END