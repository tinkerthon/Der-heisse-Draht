; p07

main:
	readadc 1, b1
	debug b0
	pause 1000
	goto main
	