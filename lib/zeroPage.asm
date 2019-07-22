// Filename memorymap.asm
 
* = $02 "zero page" virtual 
 
zeroPage: { 
 
    temp0: .byte 0
    temp1: .byte 0
    temp2: .byte 0
    temp3: .byte 0
    temp4: .byte 0
    temp5: .byte 0
    temp6: .byte 0
    temp7: .byte 0
    temp8: .byte 0
    temp9: .byte 0
 
    dTemp0: .word 0
    dTemp1: .word 0
    dTemp2: .word 0
    dTemp3: .word 0
    dTemp4: .word 0
    dTemp5: .word 0
    dTemp6: .word 0
    dTemp7: .word 0
    dTemp8: .word 0
    dTemp9: .word 0
 
    lives: .byte 0
    currentScreen: .byte 0
}  