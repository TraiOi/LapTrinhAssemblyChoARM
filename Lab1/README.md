## Lab1

 * [x] [Viết chương trình tính tổng các số <= N.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab1/Bai1.s)

 * [x] [Viết chương trình tính tổng các số chẵn, số lẻ <= N.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab1/Bai2.s)

 * [x] [Viết chương trình tính giai thừa của N.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab1/Bai3.s)

 * [x] [Viết chương trình tính tổng các số <= N và chia hết cho 5.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab1/Bai4.s)

 * [x] [Viết chương trình tính giá trị x<sup>n</sup>.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab1/Bai5.s)
 
 * [x] [Viết chương trình tính tổng 1 + x + x<sup>2</sup> + x<sup>3</sup> + … + x<sup>n</sup>.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab1/Bai6.s)

 * [x] [Viết chương trình tìm ước chung lớn nhất của 2 số.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab1/Bai7.s)

 * [x] [Viết chương trình tìm bội chung nhỏ nhất của 2 số.](https://github.com/TraiOi/LapTrinhAssemblyChoARM/blob/master/Lab1/Bai8.s)
 
**HD: Khung chương trình**

```asm
; Khai bao doan du lieu
  AREA RESET, DATA, READONLY
    DCD 0x20001000 ; stack pointer value when stack is empty
    DCD Reset_Handler ; reset vector
  ALIGN
; Khai bao doan ma lenh
  AREA MYCODE, CODE, READONLY
    ENTRY ;Khai bao diem vao chuong trinh
    EXPORT Reset_Handler
  Reset_Handler
;-------------------------------------------------------------------------
; Bat dau doan code (Diem vao cua chuong trinh)---------------------------
  MOV R0, #12
STOP
  ADD R0, R0, #4
  MOV R6, #10
  MOV R8, #10
  ADD R1, R6, R8
  B STOP ;lenh nhay den nhan STOP
BL Func1 ;goi ctr con
;------------------------------------------------------------------------
; Dinh nghia cac thu tuc
Func1 PROC
  MOV R6, #10
  MOV R8, #10
  ADD R1, R6, R8
  ENDP
;-------------------------------------------------------------------------
 END ;Ket thuc chuong trinhf
;-------------------------------------------------------------------------
```
