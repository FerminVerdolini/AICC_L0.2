// memory-mapped I/O addresses
# GPIO_SWs   = 0x80001400
# GPIO_LEDs  = 0x80001404
# GPIO_INOUT = 0x80001408

.globl main


main:
  li t0, 0x80001400 
  li t1, 0xFFFF

  sw t1, 8(t0)  
repeat:  
  addi s0, zero, 0 # cantidad de led
  addi s1, zero, 4(t0) # posicion del led
L0:
  lw t2, s0 # cargo la cantidad de leds
  sw t2, s1 # en la posicion del led

  addi s1, s1, s2 # muevo un led a la derecha
  
  bne s1, 8(t0), L0
L1:
  lw t2, s0 # cargo la cantidad de leds
  sw t2, s1 # en la posicion del led

  addi s1, s1, -1 # muevo los leds a la izquierda

  bne s1, 4(t0), L1

  addi s0, s0, 1 # agrego un led
  
  bne s0, 17, repeat 
