;G92 B500
;M913 B40			; C MOTOR TO 40% CURRENT
;G1 B-10000 F2400
;M913 B100			; C MOTOR TO 100% CURRENT
;G1 B1 F50000
;G92 B0

; homex.g
; called to home the x axis

G91 			; use relative positioning

; G1 S2 B0.5 F10000		; energise

M400 			; make sure everything has stopped before we make changes
G4 P100			; wait 400ms
M574 B1 S3 		; set endstops to use motor stall

;M915 H200 B S4 R0 F0 	; set X and Y to sensitivity 3, do nothing when stall, unfiltered

G1 H1 B-40000 F3000 	; move left 400mm, stopping at the endstop
G1 H1 B50 F2000 		; move away from end
G90 			; back to absolute positioning

M400 			; make sure everything has stopped before we reset the motor currents
G4 P100			; wait 400ms
M913 B100 		; motor currents back to 100%

;M574 B1 S0 		; Define active low and unused microswitches



