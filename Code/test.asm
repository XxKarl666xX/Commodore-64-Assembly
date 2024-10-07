 ;startup address
  * = $0801

  ;create BASIC startup (SYS line)
  !basic
     LDX #$00          ; Initialize X register to 0

clear_screen:
    LDA #$20          ; Load the ASCII code for space (32) into the accumulator
    STA $0400, X      ; Store the space character at address $0400 + X
    STA $0500, X      ; Store the space character at address $0500 + X
    STA $0600, X      ; Store the space character at address $0600 + X
    STA $0700, X      ; Store the space character at address $0700 + X
    INX               ; Increment the X register
    CPX #$FF          ; Compare X with 256
    BNE clear_screen  ; Branch to 'clear_screen' if X is not equal to 250
  
  LDY #$02 ;color1
  LDX #$00 ;color2
  LDA #$00 ;calculation in loop
  STA $DBE8 ;unused memory, put 00 on it
  
  loop:
  LDA #$00 ;clear accumulator
  STY $D020 ;set color1
  STY $D021 ;set color2
  
  delay1:
  CLC
  ADC #$01 ;a+1=a
  CMP #$FF ;is a == FF, go to next loop
  BNE delay1
  delay2:
  CLC
  LDA $DBE8 ;load unused memory into accumulator
  ADC #$01 ;add to accumulator +1
  STA $DBE8 ;store new value to unused memory
  CMP #$FF ;is unused memory = FF, go to other background change
   STX $D020
  STX $D021
  BNE delay2
 
  JMP loop ;go to loop again, forever
  ;return to BASIC
  rts
