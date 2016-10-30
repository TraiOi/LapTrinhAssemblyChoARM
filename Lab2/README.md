## Lab2

 * [x] [Viết chương trình tính tổng các phần tử trong chuỗi số.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab2/Bai1.s)

 * [x] [Viết chương trình tìm giá trị lớn nhất và nhỏ nhất trong chuỗi số.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab2/Bai2.s)

 * [x] [Viết chương trình tính trung bình cộng của chuỗi số.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab2/Bai3.s)

 * [x] [Viết chương trình tính tổng các phần tử trong ma trận.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab2/Bai4.s)

 * [x] [Viết chương trình đếm số phần tử dương, âm trong ma trận.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab2/Bai5.s)
 
 * [x] [Viết chương trình tìm giá trị lớn nhất, nhỏ nhất trên đường chéo chính.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab2/Bai6_a.s)

 * [x] [Viết chương trình tìm giá trị lớn nhất, nhỏ nhất trên đường chéo phụ.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab2/Bai6_b.s)

 * [x] [Viết chương trình tính tổng các số chẵn, lẻ trong ma trận.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab2/Bai7.s)
 
 * [x] [Viết chương trình tính tổng các số chia hết cho 5 trong ma trận.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab2/Bai8.s)
 
**HD:**

```asm
; Khai bao doan du lieu
  AREA RESET, DATA, READONLY
      DCD 0x20001000 ; stack pointer value when stack is empty
      DCD Reset_Handler ; reset vector
  ;ALIGN
nums ;khai bao vung nho nums co 100 phan tu moi phan tu 4 byte
  DCD 1,1,1,1,1,1,1,1,1,1  
  DCD 1,1,1,1,1,1,1,1,1,1
  DCD 1,1,1,1,1,1,1,1,1,1
  DCD 1,1,1,1,1,1,1,1,1,1
  DCD 1,1,1,1,1,1,1,1,1,1
  DCD 1,1,1,1,1,1,1,1,1,1
  DCD 1,1,1,1,1,1,1,1,1,1
  DCD 1,1,1,1,1,1,1,1,1,1
  DCD 1,1,1,1,1,1,1,1,1,1
  DCD 1,1,1,1,1,1,1,1,1,1
; Khai bao doan ma lenh
  AREA MYCODE, CODE, READONLY
    ENTRY ;Khai bao diem vao chuong trinh
    EXPORT Reset_Handler
Reset_Handler
;-------------------------------------------------------------------------
; Bat dau doan code (Diem vao cua chuong trinh)---------------------------
MAX EQU 100
start
  MOV R0, #0 ; sum chua trong R0; khoi tao R0 = 0
  LDR R1, =nums ; nap dia chi cua nums vao R1
  MOV R2, #0 ; dia chi offset = 0
  LDR R3, =MAX ; count = MAX
do1 LDR R4, [R1, R2]
  ADD R0, R0, R4
  ADD R2, R2, #4
  SUBS R3, #1
  CMP R3, #0
  BGT do1
stop B stop
  END
```  
