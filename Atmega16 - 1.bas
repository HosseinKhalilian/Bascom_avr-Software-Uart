'======================================================================='

' Title: Software Uart Communication Between Two MCU
' Last Updated :  01.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : Atmega16 + Atmega16

'======================================================================='

$regfile = "m16def.dat"
$crystal = 1000000
Config Porta.1 = Input
Config Portd.3 = Output
Dim A As Byte
Dim B As Byte
Dim S As String * 12

Open "comd.3:2400,8,N,1,Inverted" For Output As #1


'-----------------------------------------------------------

Main:

do

B = Pina.1

If B = 0 Then Goto Main

Print #1 , "Micro"
Wait 1

Print #1 , "Controler"
Wait 1

S = "AVR"                                                   '
Print #1 , S
Wait 1

S = "Start"
Print #1 , S

For A = 0 To 15
Print #1 , A
Wait 1
Next A

S = "Stop"
Print #1 , S

Close #1
Stop

Loop
end

'-----------------------------------------------------------