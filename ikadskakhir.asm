.model small
.code
org 100h

strart:
          jmp mulai
         teks                   db 13,10, 'APLIKASI PENJUALAN AKSESORIS MOTOR','$'
nama                   db 13,10,'Silahkan Masukkan Nama Anda       :  $'
nama1                 db 13,10,'Silahkan Masukkan No.HP Anda      :  $'
lanjut                   db 13,10,'LANJUT Tekan y untuk lanjut >>>>>> mount d: mm $'
tampung_nama           db 30,?,30 dup(?)
tampung_nama1         db 13,?,13 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
g db 07
h db 08
i db 09
j dw 15





daftar db 13,10,'APLIKASI PENJUALAN AKSESORIS MOTOR'
          db 13,10,'+---+---------------------------------------------------------+'
          db 13,10,'|   |               DAFTAR HARGA AKSESORIS MOTOR              |'
          db 13,10,'+---+--------------------------------+------------------------+'
          db 13,10,'|No |              Barang            |          Harga         |'
          db 13,10,'+---+--------------------------------+------------------------+'
          db 13,10,'|01.| Spion                          |       Rp. 150,000      |'
          db 13,10,'|02.| Side box                       |       Rp. 800,000      |'
          db 13,10,'|03.| socket charger handphone       |       Rp. 150,000      |'
          db 13,10,'|04.| Headlamp projektor             |       Rp. 400,000      |'
          db 13,10,'|05.| Shockbreaker                   |       Rp. 700,000      |'
          db 13,10,'+-------------------------------------------------------------+','$'

error               db 13,10,'KODE YANG ANDA MASUKKAN SALAH $'
pilih_barang    db 13,10,'Silahkan masukkan no barang yang anda pilih : $'
berhasil           db 13,10,'Berhasil dipilih $'

                mulai:
                mov ah,09h
                lea dx,nama
                int 21h
                mov ah,0ah
                lea dx,tampung_nama
                int 21h
                push dx

                mov ah,09h
                lea dx,nama1
                int 21h
                mov ah,0ah
                lea dx,tampung_nama1
                int 21h
                push dx


               mov ah,09h
               mov dx,offset daftar
               int 21h
               mov ah,09h
               mov dx,offset lanjut
               int 21h
               mov ah,01h
              int 21h
              cmp al,'y'
              je proses
             jne error_msg

error_msg:
            mov ah,09h
            mov dx,offset error
            int 21h
            int 20h

proses:
            mov ah,09h
            mov dx,offset pilih_barang
            int 21h

            mov ah,1
            int 21h
            mov bh,al
           mov ah,1
           int 21h
           mov bl,al
          cmp bh, '0'
          cmp bl, '1'
          je hasil1

          cmp bh, '0'
          cmp bl,  '2'
          je hasil2

         cmp bh, '0'
          cmp bl, '3'
          je hasil3

          cmp bh, '0'
          cmp bl,  '4'
          je hasil4

          cmp bh, '0'
          cmp bl,  '5'
          je hasil5
          
jne error_msg
 
hasil1:
            mov ah,09h
            lea dx,teks1
            int 21h
            int 20h
hasil2:
            mov ah,09h
            lea dx,teks2
            int 21h
            int 20h
hasil3:
            mov ah,09h
            lea dx,teks3
            int 21h
            int 20h
hasil4:
            mov ah,09h
            lea dx,teks4
            int 21h
            int 20h
hasil5:
            mov ah,09h
            lea dx,teks5
            int 21h
            int 20h

teks1   db 13,10,'Anda memilih spion '
           db 13,10,'Dengan harga yang harus anda bayar : Rp.150.000 '
           db 13,10,'Terimakasih $'
teks2   db 13,10,'Anda memilih  Side box '
           db 13,10,'Dengan harga yang harus anda bayar : Rp.800.000 '
           db 13,10,'Terimakasih $'
teks3   db 13,10,'Anda memilih socket charger handphone '
           db 13,10,'Dengan harga yang harus anda bayar : Rp.150.000 '
           db 13,10,'Terimakasih $'
teks4   db 13,10,'Anda memilih Headlamp projektor '
           db 13,10,'Dengan harga yang harus anda bayar : Rp.400.000 '
           db 13,10,'Terimakasih $'
teks5   db 13,10,'Anda memilih Shockbreaker '
           db 13,10,'Dengan harga yang harus anda bayar : Rp.700.000 '
           db 13,10,'Terimakasih $'
end 

