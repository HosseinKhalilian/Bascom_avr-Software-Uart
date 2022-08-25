'======================================================================='

' Title: Software Uart Communication Between Two MCU
' Last Updated :  01.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : Atmega16 + Atmega16

'======================================================================='

$regfile = "m16def.dat"
$crystal = 1000000
Config Portb.3 = Input
Config Portd = Output
Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , _
Db7 = Portc.7 , E = Portc.3 , Rs = Portc.2
Config Lcd = 16 * 2
Dim R As String * 12
Dim H As Byte
Declare Sub Main2

Open "comb.3:2400,8,N,1,Inverted" For Input As #1

Cursor Off
Cls
Home
Lcd "Starting"

'-----------------------------------------------------------

Main1:

Input #1 , R

If R = "Start" Then Call Main2
Cls
Home
Lcd R

Goto Main1

''''''''''''''''''''''''''''''

Main2:

Do

Input #1 , R
If R = "Stop" Then
Cls
Home
Lcd "Stop"
Stop
End If

H = Val(r)

Cls
Home
Lcd H

Portd = H

Loop

Return

End

'-----------------------------------------------------------