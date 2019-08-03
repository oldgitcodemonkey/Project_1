//
//
// main code file for test code
//
//

BasicUpstart2(main)

#import "./lib/zeroPage.asm"
#import "./lib/gameMemory.asm"
#import "./lib/lookupTables.asm"


* = $1000 "main start"


main: {

	jsr initHardware 			// disable cia etc

	lda #0
	sta zeroPage.currentScreen

	// set background colour to black
	lda #Black 
	sta BGCOL0

	lda #6
	jsr graphics.cls

	jsr graphics.drawScreen

	jsr graphics.breakChar

!:  inc EXTCOL
	jmp !-
	rts

}

initHardware: {

    //Disable CIA IRQ's to prevent crash because we've move the SID mapping
	lda #$7f	
	sta $dc0d
	sta $dd0d

	//bank out BASIC and Kernal
	lda $01
	and #%11111000
	ora #%00000101
	sta $01


	// set VIC to BANK 3
	lda $dd00
	and #11111100
	sta $dd00

	// set screen to char mem
	lda #%00001100
	sta $d018

	// multi colour mode
	lda $d016
	ora $10
	sta $d016

	rts


}


* = * "graphics routine code"
#import "./lib/graphicsRoutines.asm"

* = * "map data"
gameMap: 
.import binary "./assets/map.bin" 

* = * "Tile data"	
gameTiles: 
.import binary "./assets/TileSet.bin"

* = * "Colour attributes"	
charAtt: 
.import binary "./assets/CharAtt.bin"

* = $f000	"character sets"
charSet:
.import binary "./assets/charSet.bin"

