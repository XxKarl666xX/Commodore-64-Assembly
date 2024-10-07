 ;startup address
  * = $0801

  ;create BASIC startup (SYS line)
  !basic
LDA #$00
loop:
JSR delay
STA $D020
CLC
ADC #$01
CMP #$FF
BNE loop




;creating my delay for later, using X and free memory for caching results, need to call last so not stuck in forever loop
delay:
    CLC
delay1:
    LDX $00FC ;unused memory1, loading it to X
    INX ;increment current number thats in X by 1
    STX $00FC ;save X to the unused memory1
    CPX #$FF ;compare X to FF
    BNE delay1 ;if X-FF==0 then end this instruction sequence and go to the next, otherwise repeat
    LDX #$00 ;load into X the value 0
    STX $00FC ;store X into the unused memory1
delay2:
    LDX $00FD ;unused memory2
    INX
    DEX ;decrement X by 1, wasting cycles and thus time
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    STX $00FD
    CPX #$FF
    BNE delay2
    LDX #$00
    STX $00FD
delay3:
    LDX $00FD
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    STX $00FD
    CPX #$FF
    BNE delay3
    LDX #$00
    STX $00FD
    delay4:
    LDX $00FC
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    DEX
    INX
    STX $00FC
    CPX #$FF
    BNE delay4
    LDX #$00
    STX $00FC


  ;return to BASIC
  rts
