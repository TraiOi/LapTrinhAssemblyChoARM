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
; Viet chuong trinh tinh tong cac so chia 
; het cho 5 trong ma tran
;-----------------------------------------
MATRAN EQU 6*6
NAM EQU 5
	MOV R0, #0x00 ; Tong cac so chia het cho 5
	LDR R1, =arMatran ; Dia chi phan tu hien tai
	LDR R2, =MATRAN  ; Kich thuoc ma tran
	MOV R3, #0x01 ; Bien chay
	LDR R4, =NAM 
	
MAIN
	LDR R5, [R1] ; Gia tri phan tu hien tai
	SDIV R6, R5, R4
	MLS R6, R4, R6, R5; R6 = R6 MOD 5
	CBZ R6, CHIA_HET
	BL NEXT
CHIA_HET
	ADDS R0, R5 ; Tong cac so chan
NEXT
	ADD R3, #1
	ADD R1, #4
	CMP R3, R2
	BLT MAIN
	
STOP
	B STOP
	
	END