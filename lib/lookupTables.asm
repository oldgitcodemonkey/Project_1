* = $0820 "Golbal Tables"

tables: {

 	// each map screen is 10 rows and 20 columns - 200 bytes long
  	// these are the offsets from the base memory of the map data
  	// each offset is a different room

  	screenMapOffSet:
    	.word 0*200, 1*200, 2*200, 3*200, 4*200, 5*200, 6*200, 7*200, 8*200, 9*200, 10*200, 11*200, 12*200, 13*200, 14*200, 15*200, 16*200, 17*200, 18*200, 19*200

    tilePosition:
    	.byte 0,1,40,41 

}