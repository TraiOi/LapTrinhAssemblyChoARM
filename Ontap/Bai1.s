	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler

arPT
	DCD  3, 8,10, 0,-5, 1, 9,10,11
	DCD  4, 6, 7, 8, 9, 0, 1,10,11 
	DCD  5, 7, 9, 3,-1, 7,-5,10,11
	DCD -4, 5, 6,10, 9, 0,-9,10,11
	DCD  9, 7, 8, 0,-9,11, 8,10,11
	DCD  9, 8,11, 9,11,13, 3,10,11
	DCD 10,-9,30,20,10,33, 7,10,11
	DCD 10,10,10,10,10,10,10,15,11
	DCD 11,11,11,11,11,11,11,11,23
	
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
;-----------------------------------------
; Viet chuong trinh tinh tong cac phan tu
; trong ma tran(su dung ham main va ham 
; con)
;-----------------------------------------
COL EQU 9
ROW EQU 9
	LDR R7, =arPT
	
MAIN
	LDR R0, =COL  ; So dong
	LDR R1, =ROW  ; So cot
	LDR R2, [R7] ; Phan tu tren duong cheo chinh
	MOV R3, #0x00 ; Bien chay
	MOV R5, #0x00 ; Tong chan
	PUSH {R5}
	MOV R5, #0x00 ; Tong le
	PUSH {R5}
	MOV R5, #0x00 ; Tong nguyen to
	PUSH {R5}
	
	ADD R4, R1, #1
	LSLS R4, R4, #2 ; R4 = ROW * 4
WHILE_MAIN
	BL CHECK_CHAN_LE
RETURN_CHECK_CHAN_LE
	POP {R5}
	CMP R5, #1
	BNE TONG_LE
TONG_CHAN
	POP {R11, R12}
	BL TINH_TONG
	PUSH {R12}
	PUSH {R11}
	BL NEXT_1
TONG_LE
	POP {R11}
	BL TINH_TONG
	PUSH {R11}
NEXT_1
	BL CHECK_PRIME
RETURN_CHECK_PRIME
	POP {R5}
	CMP R5, #1
	BEQ TONG_PRIME
	BL NEXT_2
TONG_PRIME
	BL TINH_TONG
NEXT_2
	; Phan tu tiep theo tren duong cheo chinh
	ADD R7, R4
	LDR R2, [R7]
	ADD R3, #1
	CMP R3, R0
	BLT WHILE_MAIN
	POP {R2} ; Tong cac so nguyen to
	POP {R1} ; Tong cac so le
	POP {R0} ; Tong cac so chan
	BL STOP

CHECK_CHAN_LE PROC
HAI EQU 2
	LDR R6, =HAI
	SDIV R5, R2, R6
	MLS R5, R6, R5, R2
	CBZ R5, RETURN_1
	MOV R5, #0 ; Tra ve 0 (False) neu le
	PUSH {R5}
	BL RETURN_CHECK_CHAN_LE
RETURN_1
	MOV R5, #1 ; Tra ve 1 (True) neu chan
	PUSH {R5}
	BL RETURN_CHECK_CHAN_LE
	ENDP

CHECK_PRIME PROC
	MOV R5, #0x03 ; Bien chay
	CMP R2, #2
	BEQ RETURN_1_PRIME
	CMP R2, #3
	BEQ RETURN_1_PRIME
	CMP R2, #4
	BEQ RETURN_0_PRIME
WHILE_PRIME
	SDIV R6, R2, R5
	MLS R6, R5, R6, R2
	CBZ R6, RETURN_0_PRIME
	ADD R5, #2
	CMP R5, R2
	BLT WHILE_PRIME	
RETURN_1_PRIME
	MOV R5, #1
	PUSH {R5}
	BL RETURN_CHECK_PRIME
RETURN_0_PRIME
	MOV R5, #0
	PUSH {R5}
	BL RETURN_CHECK_PRIME
	ENDP

TINH_TONG PROC
	POP {R5}
	ADDS R5, R2
	PUSH {R5}
	MOV PC, LR
	ENDP

STOP
	B STOP
	
	END