#INCLUDE <P18F452.INC>
LIST P=PIC18F452, F=INHX32, N=0, ST=OFF, R=HEX
CONFIG OSC=HS, OSCS=OFF, WDT=OFF, BORV=45, PWRT=ON, BOR=ON, DEBUG=OFF, LVP=OFF, STVR=OFF

ORG 00H
BSF TRISB,0
BSF TRISB,1
BCF TRISA,0

COUNT EQU 02H
MOVLW 0x00
MOVWF COUNT
CLRF TRISD
BCF	TRISC,0
BCF	TRISC,1
BCF	TRISC,2
BCF	PORTC,2


A1  BTFSS PORTB,0
	BRA sec
	BTFSS PORTB,1
	BRA sec
	BSF PORTA,0
	INCF COUNT
	RCALL CNT
	BRA sec
sec 
	MOVF COUNT
	BZ ch
	BTFSC PORTB,0
	BRA third
	BTFSS PORTB,1
	BRA third
	BSF PORTA,0
	DECF COUNT
	RCALL CNT1
	MOVF COUNT
	BRA third
ch	
	RCALL NO
	BRA third
third
	MOVF COUNT
	BZ ch1
	BTFSS PORTB,0
	BRA fourth
	BTFSC PORTB,1
	BRA fourth
	BCF PORTA,0
	MOVF COUNT
	RCALL CNT2
	BRA fourth
ch1 
	RCALL NO
	BRA fourth
fourth
	MOVF COUNT
	BNZ	cha	
	BTFSC PORTB,0
	BRA A1
	BTFSC PORTB,1
	BRA A1
	BCF PORTA,0
	RCALL CNT3
	MOVWF COUNT
	BRA A1
cha
 BSF PORTA,0
 RCALL EN
 BRA A1
EN
   RCALL LongestDelay
	MOVLW	0x0E
	RCALL	Command
	MOVLW	A'P'
	RCALL	Write
	MOVLW	A'r'
	RCALL	Write
	MOVLW	A'e'
	RCALL	Write
	MOVLW	A's'
	RCALL	Write
	MOVLW	A'e'
	RCALL	Write
	MOVLW	A'n'
	RCALL	Write
	MOVLW	A't'
	RCALL	Write
	MOVLW	0x3C
	RCALL	Command
	MOVLW	0xC0
	RCALL	Command
	MOVLW	A'P'
	RCALL	Write
	MOVLW	A'e'
	RCALL	Write
	MOVLW	A'r'
	RCALL	Write
	MOVLW	A's'
	RCALL	Write
	MOVLW	A'o'
	RCALL	Write
	MOVLW	A'n'
	RCALL	Write
	MOVLW	0x3A
	RCALL	Write
	RCALL WriteCount

	MOVLW	0x01
	RCALL	Command
	MOVLW	0x80
	RCALL 	Command
RETURN
NO
	RCALL LongestDelay
	MOVLW	0x0E
	RCALL	Command
	MOVLW	A'R'
	RCALL	Write
	MOVLW	A'o'
	RCALL	Write
	MOVLW	A'o'
	RCALL	Write
	MOVLW	A'm'
	RCALL	Write
	MOVLW	A'_'
	RCALL	Write
	MOVLW	A'E'
	RCALL	Write
	MOVLW	A'm'
	RCALL	Write
	MOVLW	A'p'
	RCALL	Write
	MOVLW	A't'
	RCALL	Write
	MOVLW	A'y'
	RCALL	Write
	MOVLW	0x01
	RCALL	Command
	MOVLW	0x80
	RCALL 	Command
RETURN	

CNT
	RCALL LongestDelay
	MOVLW	0x0E
	RCALL	Command

	MOVLW	A'P'
	RCALL	Write

	MOVLW	A'e'
	RCALL	Write

	MOVLW	A'r'
	RCALL	Write
	
	MOVLW	A's'
	RCALL	Write
	
	MOVLW	A'o'
	RCALL	Write

	MOVLW	A'n'
	RCALL	Write

	MOVLW	A'_'
	RCALL	Write
	RCALL WriteCount ; Subroutine to write COUNT value
 	MOVLW	A'_'
	RCALL	Write

	MOVLW	A'e'
	RCALL	Write

	MOVLW	A'n'
	RCALL	Write
	
	MOVLW	A't'
	RCALL	Write
	
	MOVLW	A'e'
	RCALL	Write

	MOVLW	A'r'
	RCALL	Write
	
	MOVLW	0x01
	RCALL	Command
	
	MOVLW	0x80
	RCALL 	Command
	RETURN
CNT1
	RCALL LongestDelay
	MOVLW	0x0E
	RCALL	Command
	MOVLW	A'A'
	RCALL	Write

	MOVLW	A'f'
	RCALL	Write

	MOVLW	A't'
	RCALL	Write
	
	MOVLW	A'e'
	RCALL	Write
	
	MOVLW	A'r'
	RCALL	Write
	MOVLW	A'_'
	RCALL	Write

	MOVLW 0x31 ; ASCII for '1'
    RCALL Write
	MOVLW	A'_'
	RCALL	Write
	MOVLW	A'L'
	RCALL	Write
	
	MOVLW	A'e'
	RCALL	Write
	MOVLW	A'a'
	RCALL	Write
	MOVLW	A'v'
	RCALL	Write
	MOVLW	A'i'
	RCALL	Write
	MOVLW	A'n'
	RCALL	Write
	MOVLW	A'g'
	RCALL	Write
	MOVLW	0x3C
	RCALL	Command
	MOVLW	0xC0
	RCALL	Command
	MOVLW	A'R'
	RCALL	Write
	MOVLW	A'e'
	RCALL	Write
	MOVLW	A'm'
	RCALL	Write
	MOVLW	A'a'
	RCALL	Write
	MOVLW	A'n'
	RCALL	Write
	MOVLW	A'i'
	RCALL	Write
	MOVLW	A'n'
	RCALL	Write
	MOVLW	A'g'
	RCALL	Write
	MOVLW	A'_'
	RCALL	Write
	MOVLW	A'P'
	RCALL	Write
	MOVLW	A'e'
	RCALL	Write
	MOVLW	A'r'
	RCALL	Write
    MOVLW	0x3A
	RCALL	Write
	RCALL   WriteCount
	MOVLW	0x01
	RCALL	Command
	MOVLW	0x80
	RCALL 	Command
	
	RETURN
CNT2
	RCALL LongestDelay
	MOVLW	0x0E
	RCALL	Command
	MOVLW	A'C'
	RCALL	Write

	MOVLW	A'r'
	RCALL	Write

	MOVLW	A'o'
	RCALL	Write
	MOVLW	A's'
	RCALL	Write
	MOVLW	A's'
	RCALL	Write
	MOVLW	A'_'
	RCALL	Write
	MOVLW	A'D'
	RCALL	Write
	MOVLW	A'o'
	RCALL	Write

	MOVLW	A'o'
	RCALL	Write
	MOVLW	A'r'
	RCALL	Write
	MOVLW	A'_'
	RCALL	Write
	MOVLW	A'B'
	RCALL	Write
	MOVLW	A'u'
	RCALL	Write
	MOVLW	A't'
	RCALL	Write
	MOVLW	0x3C
	RCALL	Command
	MOVLW	0xC0
	RCALL	Command
	MOVLW	A'N'
	RCALL	Write
	MOVLW	A'O'
	RCALL	Write
	MOVLW	A'T'
	RCALL	Write
	MOVLW	A'_'
	RCALL	Write
	MOVLW	A'E'
	RCALL	Write
	MOVLW	A'n'
	RCALL	Write
	MOVLW	A't'
	RCALL	Write
	MOVLW	A'e'
	RCALL	Write
	MOVLW	A'r'
	RCALL	Write
	MOVLW	A'_'
	RCALL	Write
	MOVLW	A'R'
	RCALL	Write
	MOVLW	A'e'
	RCALL	Write
	MOVLW	A'm'
	RCALL	Write
	MOVLW	A'_'
	RCALL	Write
	MOVLW	A'P'
	RCALL	Write
	MOVLW	A'e'
	RCALL	Write
	MOVLW	0x3A
	RCALL	Write
	RCALL WriteCount
	
	MOVLW	0x01
	RCALL	Command
	
	MOVLW	0x80
	RCALL 	Command
	RETURN
CNT3
	RCALL LongestDelay
	MOVLW	0x0E
	RCALL	Command
	MOVLW	A'E'
	RCALL	Write

	MOVLW	A'm'
	RCALL	Write

	MOVLW	A'p'
	RCALL	Write
	
	MOVLW	A't'
	RCALL	Write
	
	MOVLW	A'y'
	RCALL	Write


	MOVLW	0x01
	RCALL	Command
	
	MOVLW	0x80
	RCALL 	Command
    RETURN
	
LongestDelay
	MOVLW		0x08
	MOVWF		T0CON
	MOVLW		0x6D
	MOVWF		TMR0H
	MOVLW		0x84
	MOVWF		TMR0L
	BCF			INTCON,TMR0IF
	BSF			T0CON,TMR0ON
A3	
	BTFSS		INTCON,TMR0IF
	BRA			A3
	BCF			T0CON,TMR0ON
	RETURN
Command
	MOVWF	PORTD
	BCF		PORTC,0
	BCF		PORTC,1
	BSF		PORTC,2
	RCALL	Delay
	RCALL	Delay
;	RCALL	Delay
;	RCALL	Delay
	;RCALL	Delay
	BCF		PORTC,2	
	RETURN
Write
	MOVWF	PORTD
	BSF		PORTC,0
	BCF		PORTC,1
	BSF		PORTC,2
	RCALL	Delay
	RCALL	Delay
	RCALL	Delay
;	RCALL	Delay
	;RCALL	Delay
	;RCALL	Delay
	BCF		PORTC,2
	RETURN
Delay
	MOVLW		0x08
	MOVWF		T0CON
	MOVLW		0x1D
	MOVWF		TMR0H
	MOVLW		0x70
	MOVWF		TMR0L         
	BCF			INTCON,TMR0IF
	BSF			T0CON,TMR0ON
A2	
	BTFSS		INTCON,TMR0IF
	BRA			A2
	BCF			T0CON,TMR0ON
	RETURN
WriteCount
    MOVF COUNT, W
    ADDLW 0x30 ; Convert binary value to ASCII
    RCALL Write
    RETURN
END