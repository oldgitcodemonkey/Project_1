graphics: {

	* = * "cleat screen code"

  cls: {

  	// enter with A as the blanking character
  	// for the time being leave the colour data

  	ldx #250
 !:	sta screenRAM-1,x
 	sta screenRAM+249,x
 	sta screenRAM+499,x
 	sta screenRAM+749,x
 	dex
 	bne !-

 	rts


  }
  
  * = * "screen draw code"

  drawScreen: {

  	// local variables

  	.const startOfMap = zeroPage.dTemp0
  	.const screenPointer = zeroPage.dTemp1
  	.const colourPointer = zeroPage.dTemp3 

  	.const currentRow = zeroPage.temp0
  	.const currentCol = zeroPage.temp1
  	.const mapOffset = zeroPage.temp2
  	.const tileOffset = zeroPage.temp3
  	.const currentTile = zeroPage.temp4
  	.const temp = zeroPage.temp5


  	// set end of screen pointer
  	lda #>screenRAM+758
  	sta screenPointer + 1
  	lda #<screenRAM+758
  	sta screenPointer

  	// set end of colour ram
  	lda #>colourRAM+758
  	sta colourPointer + 1
  	lda #<colourRAM+758
  	sta colourPointer

  	// get the current screen and work out the off set to the map base

  	lda zeroPage.currentScreen		// get the screen we're on
  	clc
  	asl								// double it as the off set is a word
  	tay

  	lda tables.screenMapOffSet,y			// get lsb of offset
  	adc #<gameMap
  	sta startOfMap
  	lda tables.screenMapOffSet+1,y 		// get msb of of map
  	adc #>gameMap
  	sta startOfMap+1

  	// zeropage start of map now has the address of the end of the current screen
  	// drawing the screen from end to start

  	lda #199
  	sta mapOffset 					// pointer to the last screen block

  	lda #9
  	sta currentRow

 rowLoop:

 	lda #19
 	sta currentCol

 colLoop:
 	// get current tile

 	ldy mapOffset
 	lda (startOfMap),y			// get the current tile

 	asl							// shift twice
	asl							// to multiply by 4 to give us the offset into the tiles table
	adc #$03					// working backwards so now go to the end of the tile
	// (a contains tile)
	sta currentTile 						// store tile offset

	// get char 

	ldx #$03
charLoop:
	ldy currentTile				// put the tile pointer into y
	lda gameTiles,y				// get the character
	ldy tables.tilePosition,x			// get the screen offset relative to this tile
	sta (screenPointer),y		// put the char on screen

	sty temp 					// save the offset
	tay							// put current char into y
	lda charAtt,y 			    // get colour back
	ldy temp 					// get the offset back=
	sta (colourPointer),y		// put colour on screen
	   
    dec currentTile				// next char in tile
	dex							// decrease the loop
	bpl charLoop

	
	lda screenPointer   		// decrease the screen by two
	sec 						// set the carry
	sbc #$02
	sta screenPointer 
	lda screenPointer +1
	sbc #$00
	sta screenPointer +1

	lda colourPointer   		// decrease the screen by two
	sec 						// set the carry
	sbc #$02
	sta colourPointer 
	lda colourPointer +1
	sbc #$00
	sta colourPointer +1

	dec mapOffset 				// next tile 
	dec currentCol				// next column
	bpl colLoop

	// next row

	lda screenPointer   		// decrease the screen by two
	sec 						// set the carry
	sbc #$28 
	sta screenPointer 
	lda screenPointer +1
	sbc #$00
	sta screenPointer +1

	lda colourPointer   		// decrease the screen by two
	sec 						// set the carry
	sbc #$28 
	sta colourPointer 
	lda colourPointer +1
	sbc #$00
	sta colourPointer +1

	dec currentRow 
	bpl rowLoop

  	rts

 
  }

  breakChar: {

top:
  	ldx #$07
 !:	lda $f000,x
    ror
    sta $f000,x

    dex 
    bpl !-

    jmp top
    rts
  }

}