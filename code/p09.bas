; p09

main:	if input1 is on then dohigh
	low 0
	goto main
	
dohigh:
	high 0
	goto main
	