; "Chessboard", Atari XL/XE Intro 32B
; (31 bytes of code + 6 bytes of header)
; code by tr1x / Agenda
; requirements: original Atari XL/XE 64KB PAL
; version: 1.0
; release date: 2022-02-13

rtclok	equ $0012
pcolr0	equ $02c0
hposp0	equ $d000
sizep0	equ $d008
colpm0	equ $d012
vcount	equ $d40b


	org $bc20;-29		; thx Koala for the hint

loop1	lda vcount
	adc rtclok+2
	and #%11100000
	adc rtclok+2
	ldy #$08
loop2	sta hposp0-1,y
	sta pcolr0-3,y
	adc #$40
	pha
	lda #$ff
	sta sizep0,y
	pla
	dey
	bpl loop2
	bmi loop1