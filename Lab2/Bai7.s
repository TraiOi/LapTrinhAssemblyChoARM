	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	
arMatran
	DCD  4, 6, 8,-1, 4,-2
	DCD  5,-5,-7, 9,-1, 0
	DCD -3,11,-9, 8, 0,-4
	DCD  5, 5, 5, 5, 5,-1
	DCD  1, 3, 5, 7, 1, 2
	DCD  0, 1, 1, 1,10, 3
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tinh tong cac so chan,
; le trong ma tran
;-----------------------------------------
MATRAN EQU 6*6
HAI EQU 2
	MOV R0, #0x00 ; Tong cac so chan
	MOV R1, #0x00 ; Tong cac so le
	LDR R2, =arMatran ; Dia chi phan tu hien tai
	LDR R3, =MATRAN  ; Kich thuoc ma tran
	MOV R4, #0x01 ; Bien chay
	LDR R5, =HAI 
	
MAIN
	LDR R6, [R2] ; Gia tri phan tu hien tai
	SDIV R7, R6, R5
	MLS R7, R5, R7, R6; R7 = R6 MOD 2
	CBZ R7, SO_CHAN
	ADDS R1, R6 ; Tong cac so le
	BL NEXT
SO_CHAN
	ADDS R0, R6 ; Tong cac so chan
NEXT
	ADD R4, #1
	ADD R2, #4
	CMP R4, R3
	BLT MAIN
	
STOP
	B STOP
	
	END