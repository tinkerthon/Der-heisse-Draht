;	EM-Tronic Kit  19/10/2011
; Leicht abgewandelt von http://www.instructables.com/id/EM-Tronic-Synth/step3/Fit-the-components-part-B/
 
symbol choice	=	b1 
symbol i		=	b6
symbol Length	=	b7 
symbol MemFreq1	=	b8
symbol MemFreq2	=	b9
symbol MemFreq3	=	b10
symbol MemFreq4	=	b11
symbol MemFreq5	=	b12
symbol MemFreq6	=	b13

;---------------------------------- setup ------------------------------------------------------------
setfreq m8

choice = 1
;-----------------------------------------------------------------------------------------------------



;--------------------------------- Main --------------------------------------------------------------
Main:
	high 4
	 
	readadc 1,Memfreq1		;read frequency control
	if pin3 is on then
		readadc 1,Length		;read frequency control
	else
		readadc 1,Memfreq1		;read frequency control

	endif
	if memfreq1 = 0  then : memfreq1 = 1 :endif
; 

;---------------------------------- toggle -----------------------------------------------------------


	if length = 255 then : gosub menu :endif

	if choice = 1 then : gosub noise1 
	else if choice = 2 then : gosub noise2 
	else gosub noise3
	endif

goto main


noise1:

;high 4
	sound 2,(MemFreq1,4); first 4
	for i = 1 to length			
	next i
 	
 	sound 2,(MemFreq2,4); first 4
 		for i = 1 to length			
	next i
 	
 	sound 2,(MemFreq3,2); first 4	 
 		for i = 1 to length			
	next i
 
 low 4
 
 	sound 2,(MemFreq4,1); first 4
 		for i = 1 to length			
	next i
 
 	sound 2,(MemFreq5,1); first 4 
 		for i = 1 to length			
	next i
 	
 	sound 2,(MemFreq6,1); first 4
;		for i = 1 to length			
;	next i
	
	
	MemFreq6 = MemFreq5
	MemFreq5 = MemFreq4	
	MemFreq4 = MemFreq3
	MemFreq3 = MemFreq2							;LED off
 	MemFreq2 = MemFreq1
return



noise2:
;high 4
	sound 2,(MemFreq1,4); first 4
 ;	sound 2,(MemFreq2,0); first 4

 ;	sound 2,(MemFreq3,0); first 4	 
 ;	sound 2,(MemFreq4,0); first 4
 	
 ;	sound 2,(MemFreq5,0); first 4 
 	sound 2,(MemFreq6,1); first 4
	
	
	;for i = 1 to 5
	pause length
	;next i 
	pause length
	pause length

low 4

	pause length
	pause length
		
	MemFreq6 = MemFreq5
	MemFreq5 = MemFreq4	
	MemFreq4 = MemFreq3
	MemFreq3 = MemFreq2							;LED off
 	MemFreq2 = MemFreq1
return



noise3:
	
	length = length / 8 
	if length = 0  then : length = 1 :endif 
;high 4
	sound 2,(MemFreq1,length); first 4
 	sound 2,(MemFreq2,length); first 4

 	sound 2,(MemFreq3,length); first 4	 
 
 low 4
 
 	sound 2,(MemFreq4,length); first 4
 	
 	sound 2,(MemFreq5,length); first 4 
 	sound 2,(MemFreq6,length); first 4
	
	
	;for i = 1 to length			
	;next i
 	
 	pause length
 	
	MemFreq6 = MemFreq5
	MemFreq5 = MemFreq4	
	MemFreq4 = MemFreq3
	MemFreq3 = MemFreq2							;LED off
 	MemFreq2 = MemFreq1
return




Menu:

do

	for i = 1 to 150

		if choice = 1 and i = 1 then : high 4  	:endif

		if choice <= 2 and i = 40 then : high 4 :endif

		if choice <= 3 and i =80  then : high 4 	:endif

		

		readadc 1,Memfreq1		;read frequency control
		readadc 2,Length			;read speed control
		
		
		
		sound 2,(MemFreq1,1)		; first 4
	
		if Memfreq1 < 85 then : choice = 3
		else if Memfreq1 => 85 and memfreq1 < 170 then : choice =2	
		else 	choice = 1
		endif
		
		low 4
		
	next i
	
loop while Length = 255


return
