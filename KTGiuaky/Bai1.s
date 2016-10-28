	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Reset_Handler
	ALIGN

ABC DCD 1,-4,2

	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
; -------------------------------------------
; Viet phuong trinh tinh bac 2
; ax^2 + bx + c = 0
; Ap dung cho sqrt(delta) < 10 vi sai so lon
; -------------------------------------------
MOTNGAN EQU 1000
	LDR R6, =ABC ;
	LDR R3, [R6] ; A
	LDR R4, [R6,#4] ; B
	LDR R5, [R6,#8] ; C

MAIN
	; Tinh Delta
	MUL R2, R4, R4 ; R2 = B^2
	LSLS R6, R3, #2 ; R6 = 4*A
	MUL R6, R5 ; R6 = 4*A*C
	CMP R2, R6
	BLT VO_NGHIEM
	BEQ MOT_NGHIEM
	SUBS R2, R2, R6 ; Delta = R2 = B^2 - 4*A*C
	PUSH {R2, R3, R4} ; Luu Delta, A, B vao stack
	BL SQRT
RETURN_SQRT
	POP {R2, R3} ; R2 = Phan nguyen sqrt(delta), R3 = Phan thap phan sqrt(delta)
	POP {R4, R5} ; R4 = A, R5 = B
	MOV R6, #0x00 ; Bien chay
	LDR R7, =MOTNGAN
	MUL R5, R7 ; B * 1000
	SUBS R5, R6, R5 ; R5 = -B*1000
	LSLS R4, R4, #1 ; R4 = 2*A
HAI_NGHIEM
	MLA R1, R2, R7, R3 ; sqrt(delta) * 1000
	CBZ R6, X1
X2 ; Tinh X2 = (-B + sqrt(delta))/(2A)
	ADDS R1, R5, R1 ; R1 = -B + sqrt(delta)
	BL NEXT_X
X1 ; Tinh X1 = (-B - sqrt(delta))/(2A),
	SUBS R1, R5, R1 ; R1 = -B - sqrt(delta)
NEXT_X
	SDIV R1, R1, R4 ; R1 = R1 / (2A)
	SDIV R0, R1, R7 ; R0 = Phan nguyen
	MLS R1, R0, R7, R1 ; R1 = phan thap phan
	PUSH {R0, R1}
	ADD R6, #1
	CMP R6, #2
	BLT HAI_NGHIEM
	POP {R0, R1} ; R0 = phan nguyen X1, R1 = phan thap phan X1
	POP {R2, R3} ; R2 = phan nguyen X2, R3 = phan thap phan X2
	BL STOP
VO_NGHIEM
	BL STOP
MOT_NGHIEM
	MOV R7, #0x00
	SUBS R4, R7, R4 ; R4 = -B
	LSLS R1, R3, #1 ; R1 = 2*A
	SDIV R0, R4, R1 ; R0 = X = -B/(2*A) , phan nguyen cua X
	MLS R1, R0, R1, R4 ; R1 = Phan thap phan cua X
	BL STOP
	
; Ham tinh can bac 2
SQRT PROC
MUOI EQU 10
HAI EQU 2
	LDR R4, =HAI
	POP {R0} ; R0 = Delta;
	; Neu sqrt(Delta) la so nguyen
	MOV R1, #0x01 ; Bien chay
	UDIV R3, R0, R4
WHILE_LOOP_1
	MUL R2, R1, R1
	CMP R2, R0
	BNE NEXT_WHILE_1
	MOV R3, #0x00
	PUSH {R1, R3}
	BL RETURN_SQRT
NEXT_WHILE_1
	ADD R1, #1
	CMP R1, R3
	BLT WHILE_LOOP_1
	;--------------------------
	; Neu sqrt(Delta) la so thap phan : sqrt(delta) = y = (x/y + y)/2 + y
	MOV R1, #0x01 ; Y, phan nguyen
	MOV R2, #0x00 ; Y, phan thap phan
	LDR R3, =MUOI
	MOV R6, #0x01 ; temp_y
	MOV R7, #0x02 ; Bien chay
WHILE_LOOP_2  ;       Gia su R0 = 5 |   PART0,   PART1,         PART2
	UDIV R5, R0, R1; temp = x/y =     5/1=1, 50/3=16, 50000/23=2173
	SUBS R5, R6; temp = temp - temp_y =   4,     -14,          -127
	SDIV R5, R4 ; temp = temp / 2 =       2,      -7,           -63
	ADDS R5, R6; temp = temp + temp_y =   3,      23,          2237
	MOV R1, R5 ; y = temp =               3,      23,          2237
	SUB R7, #1
	CMP R7, #1
	BEQ PART1
	CBZ R7, PART2
	BL KETTHUC
PART1
	MUL R0, R3 ;                          5,      50
	MUL R6, R1, R3 ; temp_y =             1,      30
	BL WHILE_LOOP_2
PART2
	MUL R0, R3 ;                          5,      50,           500
	MUL R0, R3 ;                          5,      50,          5000
	MUL R0, R3 ;                          5,      50,         50000
	MUL R6, R1, R3 ; temp_y =             1,      30,           230
	MUL R6, R6, R3 ; temp_y =             1,      30,          2300
	BL WHILE_LOOP_2
KETTHUC
	; Lay phan nguyen va phan thap phan
	MUL R4, R3, R3 ; R4 =  100
	MUL R4, R3     ; R4 = 1000
	UDIV R1, R5, R4  ; R1 = 2237/1000 = 2
	MLS R2, R1, R4, R5;R2 = 2237-(1000*2) = 237
	PUSH {R1, R2}
	BL RETURN_SQRT
	ENDP

STOP
	B STOP

	END
	