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
; Viet chuong trinh tim gia tri lon nhat,
; nho nhat tren duong cheo phu trong ma 
; tran
;-----------------------------------------
ROW EQU 6
COL EQU 6
	LDR R4, =arMatran ; Dia chi phan tu hien tai
	LDR R5, =ROW  ; So dong
	LDR R6, =COL  ; So cot
	MOV R7, #0x01 ; Bien chay

MAIN
	LSLS R5, #2
	SUB R5, #4
	ADD R4, R5
	LDR R0, [R4] ; Duong cheo phu (MAX)
	LDR R1, [R4] ; Duong cheo phu (MIN)
CHEO_CHINH
	BL NEXT_PT
NEXT
	ADD R7, #1
	CMP R2, R0
	BGT CHEO_CHINH_MAX
NEXT_CHEO_CHINH_MAX
	CMP R2, R1
	BLT CHEO_CHINH_MIN
NEXT_CHEO_CHINH_MIN
	CMP R7, R6
	BLT CHEO_CHINH
	BL STOP
	
CHEO_CHINH_MAX
	MOV R0, R2
	BL NEXT_CHEO_CHINH_MAX
CHEO_CHINH_MIN
	MOV R1, R2
	BL NEXT_CHEO_CHINH_MIN

NEXT_PT	; Phan tu tiep theo tren duong cheo chinh
	ADD R4, R5
	LDR R2, [R4] ; Duong cheo chinh
	BL NEXT

STOP
	B STOP
	
	END