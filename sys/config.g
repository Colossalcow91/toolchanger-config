; Configuration file for Duet WiFi / Ethernet
; executed by the firmware on start-up

; General preferences
M111 S0 						; Debugging off
G21 							; Work in millimetres
G90 							; Send absolute coordinates...
M83 							; ...but relative extruder moves
M555 P2 						; Set firmware compatibility to look like Marlin
M550 P"ToolChanger"					; Set Printer Name

; Network
; Read https://duet3d.dozuki.com/Wiki/Gcode#Section_M587_Add_WiFi_host_network_to_remembered_list_or_list_remembered_networks
M552 S1						  	; Enable Networking
M586 P0 S1 						; Enable HTTP
M586 P1 S0 						; Disable FTP
M586 P2 S0 						; Disable Telnet

M667 S1 						; Select CoreXY mode

; Endstops
M574 X1 S3
M574 Y1 S3
M574 B1 S3 						; Set X / Y endstop stall detection

M574 Z0 P"nil" 						; Set Z endstop probe

M558 P8 C"zstop" H5 F120 T10000 A5 S0.01     		; Set Z probe type to switch, the axes for which it is used and the dive height + speeds @DC42

; G31 Z0

G31 P200 X0 Y0 Z0	 				; Set Z probe trigger value, offset and trigger height

M557 X10:290 Y20:180 S20 				; Define mesh grid

; Drive direction
M569 P0 S0 						; Drive 0 X
M569 P1 S0 						; Drive 1 Y
M569 P2 S1 						; Drive 2 Z
M569 P3 S1 						; Drive 3 E0
M569 P4 S1						; Drive 4 E1
M569 P5 S1 						; Drive 5 E2
M569 P6 S1 						; Drive 6 E3
M569 P7 S0 						; Drive 7 COUPLER
M569 P8 S1 						; Drive 8 BRUSH
M569 P9 S0 						; Drive 9 UNUSED

M584 X0 Y1 Z2 C7 B8 E3:4:5:6 								; Apply custom drive mapping

M208 X-35:328.5 Y-49:243 Z0:283 C0:500 B0:122 S0 			; Set axis maxima & minima

M350 E16:16:16:16 C8 I0 									; Configure microstepping without interpolation
M350 X16 Y16 Z16 B16 I1										; Configure microstepping with interpolation

M92 X100 Y100 Z1600 C100 B200 E393:393:393:393				; Set steps per mm

M566 X500 Y500 Z200 C2 B2 E2:2:2:2							; Set maximum instantaneous speed changes (mm/min)
M203 X35000 Y35000 Z1200 C5000 B5000 E5000:5000:5000:5000	; Set maximum speeds (mm/min)
M201 X3500 Y3500 Z400 C400 B400 E2500:2500:2500:2500		; Set accelerations (mm/s^2)

M906 X2000 Y2000 Z1330 C400 B1000 E1330:1330:1330:1330 I30  ; Set motor currents (mA) and motor idle factor in percent

;M84 S120 													; Set idle timeout

;Stall Detection
M915 C S3 F1 H400				; Coupler

;Stall Detection
M915 X Y S5 F0 H400 R2				; X / Y Axes

;Stall Detection
M915 B S5 F0 H400 R4700					; B Axis

; Old Thermistors
;M305 P0 T100000 B4138 C0 				; Set thermistor
;M305 S"T0" P5 T100000 B4725 C7.06e-8 	; Set thermistor
;M305 S"T1" P2 T100000 B4725 C7.06e-8	; Set thermistor
;M305 S"T2" P3 T100000 B4725 C7.06e-8	; Set thermistor
;M305 S"T3" P4 T100000 B4725 C7.06e-8 	; Set thermistor

; Bed
M308 S0 P"bedtemp" Y"thermistor" A"Bed" T100000 B4138 C0 
M950 H0 C"bedheat" T0
M140 H0
M143 H0 S115 							; Set temperature limit for heater 0 to 115C

; Tool Thermistors and Heaters
M308 S1 P"e0temp" Y"thermistor" A"T0" T100000 B4725 C7.06e-8
M308 S2 P"e1temp" Y"thermistor" A"T1" T100000 B4725 C7.06e-8
M308 S3 P"duex.e2temp" Y"thermistor" A"T2" T100000 B4725 C7.06e-8
M308 S4 P"duex.e3temp" Y"thermistor" A"T3" T100000 B4725 C7.06e-8

M950 H1 C"duex.e4heat" T1
M950 H2 C"e1heat" T2
M950 H3 C"duex.e2heat" T3
M950 H4 C"duex.e3heat" T4

M143 H1 S305
M143 H2 S305 							; Set temperature limit for heater 2 to 300C
M143 H3 S305 							; Set temperature limit for heater 3 to 300C
M143 H4 S305 							; Set temperature limit for heater 4 to 300C

;c?
M574 C1 S3

;Disable Heater 7 for rainbow go brrr
;M307 H7 A-1 C-1 D-1

; Fans
M950 F0 C"fan0"
M106 P0 S255 H2 T50					; T1 HE

M950 F1 C"fan1"
M106 P1 S255 H1 T50					; T0 HE

M950 F2 C"fan2"
M106 P2 S0  						; T0 PCF

M950 F3 C"duex.fan3"
M106 P3 S0						; unused

M950 F4 C"duex.fan4"
M106 P4 S0				      	 	; T1 PCF

M950 F5 C"duex.fan5"
M106 P5 S255 H3 T50 					; T2 HE

M950 F6 C"duex.fan6"
M106 P6 S0					     	; T2 PCF

M950 F7 C"duex.fan7"
M106 P7 S255 H4 T50					; T3 HE

M950 F8 C"duex.fan8"
M106 P8 S0					     	; T3 PCF

M950 F9 C"duex.e6heat"					
M106 P9 S255 H2 T50					; LED go brrr

; Tools
M563 P0 S"T0" D0 H1 F2					; Define tool 0
G10 P0 X0 Y0 Z0 						; Reset tool 0 axis offsets
G10 P0 R0 S0 							; Reset initial tool 0 active and standby temperatures to 0C

M563 P1 S"T1" D1 H2 F4					; Define tool 1
G10 P1 X0 Y0 Z0 						; Reset tool 1 axis offsets
G10 P1 R0 S0 							; Reset initial tool 1 active and standby temperatures to 0C

M563 P2 S"T2" D2 H3 F6					; Define tool 2
G10 P2 X0 Y0 Z0							; Reset tool 2 axis offsets
G10 P2 R0 S0 							; Reset initial tool 2 active and standby temperatures to 0C

M563 P3 S"T3" D3 H4 F8					; Define tool 3
G10 P3 X0 Y0 Z0 						; Reset tool 3 axis offsets
G10 P3 R0 S0 							; Reset initial tool 3 active and standby temperatures to 0C

M593 F50						; cancel ringing at 50Hz (https://forum.e3d-online.com/threads/accelerometer-and-resonance-measurements-of-the-motion-system.3445/)
;M376 H15						; bed compensation taper

;tool offsets
G10 P0 X22.85 Y42.75 Z-5.85				; T0
G10 P1 X23.45 Y41.97 Z-5.64				; T1
G10 P2 X23.55 Y42 Z-5.95				; T2
G10 P3 X22.35 Y42.05 Z-5.775				; T3

M918 P2 E2

;deselect tools
T-1

;M572 D0 S0.2 						; pressure advance T0
;M572 D1 S0.2 						; pressure advance T1
;M572 D2 S0.2 						; pressure advance T2
;M572 D3 S0.2 						; pressure advance T3

M107

M501