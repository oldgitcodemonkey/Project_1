//
// $0200-$9FFF  RAM (40K)

.const screenRAM      = $c000
.const colourRAM	  = $d800

.const SPRITE0         = $07F8

// $0801
// Game code is placed here by using the *=$0801 directive 
// in gameMain.asm 


//===============================================================================
// $A000-$BFFF  BASIC ROM (8K)


//===============================================================================
// $C000-$CFFF  RAM (4K)


//===============================================================================
// $D000-$DFFF  IO (4K)

// These are some of the C64 registers that are mapped into
// IO memory space
// Names taken from 'Mapping the Commodore 64' book

.const SP0X            = $D000
.const SP0Y            = $D001
.const MSIGX           = $D010
.const RASTER          = $D012
.const SPENA           = $D015
.const SCROLX          = $D016
.const VMCSB           = $D018
.const SPBGPR          = $D01B
.const SPMC            = $D01C
.const SPSPCL          = $D01E
.const EXTCOL          = $D020
.const BGCOL0          = $D021
.const BGCOL1          = $D022
.const BGCOL2          = $D023
.const BGCOL3          = $D024
.const SPMC0           = $D025
.const SPMC1           = $D026
.const SP0COL          = $D027
.const FRELO1          = $D400 //(54272)
.const FREHI1          = $D401 //(54273)
.const PWLO1           = $D402 //(54274)
.const PWHI1           = $D403 //(54275)
.const VCREG1          = $D404 //(54276)
.const ATDCY1          = $D405 //(54277)
.const SUREL1          = $D406 //(54278)
.const FRELO2          = $D407 //(54279)
.const FREHI2          = $D408 //(54280)
.const PWLO2           = $D409 //(54281)
.const PWHI2           = $D40A //(54282)
.const VCREG2          = $D40B //(54283)
.const ATDCY2          = $D40C //(54284)
.const SUREL2          = $D40D //(54285)
.const FRELO3          = $D40E //(54286)
.const FREHI3          = $D40F //(54287)
.const PWLO3           = $D410 //(54288)
.const PWHI3           = $D411 //(54289)
.const VCREG3          = $D412 //(54290)
.const ATDCY3          = $D413 //(54291)
.const SUREL3          = $D414 //(54292)
.const SIGVOL          = $D418 //(54296)      
.const COLORRAM        = $D800
.const CIAPRA          = $DC00
.const CIAPRB          = $DC01

//===============================================================================
// $E000-$FFFF  KERNAL ROM (8K) 


//===============================================================================


// a few useful constants

.const Black           = 0
.const White           = 1
.const Red             = 2
.const Cyan            = 3 
.const Purple          = 4
.const Green           = 5
.const Blue            = 6
.const Yellow          = 7
.const range          = 8
.const Brown           = 9
.const LightRed        = 10
.const DarkGray        = 11
.const MediumGray      = 12
.const LightGreen      = 13
.const LightBlue       = 14
.const LightGray       = 15
.const SpaceCharacter  = 32

.const False           = 0
.const True            = 1
