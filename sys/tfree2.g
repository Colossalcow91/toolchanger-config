; tfree0.g
; called when tool 0 is freed

G1 E-1 F6000

;Drop the bed
G91
G1 Z4 F1000
G90

;mesh levelling off
G29 S2

;Purge nozzle
M98 Ppurgeb.g

;fan off
M106 P6 S0

;Move In
G53 G1 X211.3 Y150 F50000
G53 G1 X211.3 Y210 F50000
G53 G1 X211.3 Y220 F50000
G53 G1 X211.3 Y225 F25000

;Open Coupler
M98 P/macros/Coupler - Unlock

;Move Out
G53 G1 X211.3 Y175 F50000
