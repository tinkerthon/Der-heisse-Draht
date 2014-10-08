#rem
Simple PICAXE 08m basic program that randomly and independently controls
brightness of all 3 colors in a RGB LED
creating calming patterms (like in a mood lamp).
See my blog http://rtfms.com for more details

You're free to do whatever you want with this code, just mention my blog http://andrey.mikhalchuk.com
in the comments, so people can find updated code. Thanks!
#endrem

#picaxe 08m2
setfreq m4

; config
symbol SPEED = 3 ; the smaller the value the higher the color change speed
symbol SPEED_VARIATIONS = 7 ; defines how many different color change speeds should it use

; map pins
symbol RED0_PIN = 0
symbol GREEN0_PIN = 4
;symbol BLUE0_PIN = 2


; map pin values to mem
; pin value is the current brightness of the LED
symbol red0 = b0
symbol green0 = b1
;symbol blue0 = b2

; map pin_deltas to mem
; delta is the speed of the brightness change
symbol red0_delta = b3
symbol green0_delta = b4
;symbol blue0_delta = b5

; temp values for the subroutine
symbol delta_w = w3
symbol tmp = b7

; subroutine parameters
symbol pin = b8
symbol val = b9
symbol delta = b10

; initialize everything
red0 = 0
green0 = 70
;blue0 = 200
red0_delta = 1
green0_delta = 5
;blue0_delta = 9

; start servo mode
; note that "servopos RED0_PIN, 255" renders LED off!!
; "servopos RED0_PIN, 0" makes it really dim, but lit. Is that a bug in PICAXE?
servo RED0_PIN, 255
servo GREEN0_PIN, 255
;servo BLUE0_PIN, 255

; this code is like loop() in arduino
main:
; emulating function call in function-less environment
pin = RED0_PIN : val = red0 : delta = red0_delta : gosub set_color_val : red0 = val : red0_delta = delta
pin = GREEN0_PIN : val = green0 : delta = green0_delta : gosub set_color_val : green0 = val : green0_delta = delta
;pin = BLUE0_PIN : val = blue0 : delta = blue0_delta : gosub set_color_val : blue0 = val : blue0_delta = delta
goto main

; this sub adjusts the brightness of the LED and delta
set_color_val:
val = val + delta
if delta < 128 and val < delta then ; fwd
random delta_w
delta = delta % SPEED_VARIATIONS + 1
delta = 255 - delta
val = 255
elseif delta >= 128 and val <= delta then ; reverse
random delta_w
delta = delta % SPEED_VARIATIONS + 1
val = 0
endif
tmp = val - 1 ; servopos bug workaround
; yeah, servopos takes only constant as the first argument :(
if pin = RED0_PIN then
servopos RED0_PIN, tmp
elseif pin = GREEN0_PIN then
servopos GREEN0_PIN, tmp
;elseif pin = BLUE0_PIN then
;servopos BLUE0_PIN, tmp
endif
pause SPEED
return
