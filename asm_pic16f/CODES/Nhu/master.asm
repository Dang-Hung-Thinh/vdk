PROCESSOR PIC16F877A
#INCLUDE<P16F877A.INC>
__CONFIG _HS_OSC&_WDT_OFF&_BODEN_OFF&_PWRTE_OFF&_WRT_OFF&_CPD_OFF&_LVP_OFF

CBLOCK 0X20
COUNT

ENDC
ORG 0X00

BSF PORTA,0 ;  khong truyen nhan du lieu
BSF STATUS,5  ; chon bank1
MOVLW 0XFF
MOVWF TRISD  ; portd la p?t nhap du lieu

CLRF TRISB  ; portb la port xuat du lieu
MOVLW 0X07
MOVWF ADCON1 ; porta xuat nhap /du lieu
BCF TRISC,5  ; rc5 CHAN PHAT DU LIEU
BCF TRISC,3  ; RC3 PHAT XUNG CLOCK
BSF TRISC,4  ; RC4 NHAP DU LIEU
CLRF TRISA  ; RA0 LA CHAN XUAT

BSF SSPSTAT,7 ; LUA CHON DU LIEU DUOC LAY O CUOI XUNG CLOCK
BCF SSPSTAT,6 ; LUA CHON QUA TRINH TRUYEN DU LIEU DIEN RA KHI XUNG CLOCK CHUYEN TU THAP SANG CAO
BSF SSPSTAT,0 ; KO CO GIA TRI MOI DUOC DUA VAO SSPBUF

BCF STATUS,5 ; BANK0

BSF SSPCON,5 ; CHO PHEP CHUAN GIAO TIEP MSSP
BCF SSPCON,4 ; KHI CHUA TRUYEN NHAN THI XUNG CLOCK O MUC THAP
BCF SSPCON,3 ; LUA CHON MASTER, CLOCK= Fosc/64
BCF SSPCON,2
BSF SSPCON,1
BCF SSPCON,0

CLRF PORTB

BCF PORTA,0  ; chon slave
LOOP
MOVF PORTD,0
MOVWF SSPBUF  ; CHUYEN DU LIEU VAO

BSF STATUS,5  ; CHON BANK 1
BTFSS SSPSTAT,0 ;;  KIEM TRA CO BAO SSPBUF
GOTO $-1
BCF STATUS,5 ; BANK0

MOVF SSPBUF,0
MOVWF PORTB
GOTO LOOP

END