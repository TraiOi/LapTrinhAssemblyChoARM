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
;
;-----------------------------------------
COL EQU 9
	
MAIN
	LDR R1, =COL  ; So dong va cot
	; Stack = [MIN_DCP, MAX_DCP, TBC_DCC, UCLN]
	
	LDR R0, =arPT
	MOV R2, #0x00 ; Bien chay
	SUB R3, R1, #1
	LSLS R3, #2
	ADD R0, R3
	LDR R4, [R0] ; Duong cheo phu (MIN)
	LDR R5, [R0] ; Duong cheo phu (MAX)
	BL CHEO_PHU
RETURN_CHEO_PHU
	LDR R0, =arPT
	MOV R2, #0x00 ; Bien chay
	ADD R3, R1, #1
	LSLS R3, #2
	LDR R4, [R0] ; Duong cheo chinh
	MOV R5, #0x00 ; TBC
	BL CHEO_CHINH
RETURN_CHEO_CHINH
	POP {R0}
	POP {R1}
	POP {R2}
	PUSH {R0}
	PUSH {R1}
	PUSH {R2}
	; Tim UCLN
	MOV R3, #0x00 ; UCLN
	CMP R0, R1
	BGT NEXT_MAIN_1
	BL HOAN_VI
NEXT_MAIN_1
	BL UCLN
	MOV R1, R2
	MOV R3, #0x00 ; UCLN
	CMP R0, R1
	BGT NEXT_MAIN_2
	BL HOAN_VI
NEXT_MAIN_2
	BL UCLN
	PUSH {R0}
	POP {R3} ; UCLN
	POP {R2} ; MAX duong cheo phu
	POP {R1} ; MIN duong cheo phu
	POP {R0} ; TBC duong cheo chinh
	BL STOP

HOAN_VI PROC
	PUSH {R0}
	PUSH {R1}
	POP {R0, R1}
	BX LR
	ENDP

UCLN PROC
	SDIV R4, R0, R1
	MLS R4, R1, R4, R0
	CMP R4, #0
	MOV R0, R1
	MOV R1, R4
	BNE UCLN
	BX LR
	ENDP

CHEO_PHU PROC
	ADD R2, #1
	ADD R0, R3
	LDR R6, [R0]
	BL TIM_MIN
RETURN_TIM_MIN
	BL TIM_MAX
RETURN_TIM_MAX
	CMP R2, R1
	BLT CHEO_PHU
	PUSH {R4}
	PUSH {R5}
	BL RETURN_CHEO_PHU
	ENDP

CHEO_CHINH PROC
	BL TONG
RETURN_TONG
	ADD R2, #1
	ADD R0, R3
	LDR R4, [R0]
	CMP R2, R1
	BLT CHEO_CHINH
	;Tinh TBC
	SDIV R5, R5, R1
	PUSH {R5}
	BL RETURN_CHEO_CHINH
	ENDP

TONG PROC
	ADD R5, R4
	BL RETURN_TONG
	ENDP

TIM_MIN PROC
	CMP R6, R4
	BLT NEXT_MIN
	BL RETURN_TIM_MIN
NEXT_MIN
	MOV R4, R6
	BL RETURN_TIM_MIN
	ENDP

TIM_MAX PROC
	CMP R6, R5
	BGT NEXT_MAX
	BL RETURN_TIM_MAX
NEXT_MAX
	MOV R5, R6
	BL RETURN_TIM_MAX
	ENDP
	
STOP
	B STOP
	
	END