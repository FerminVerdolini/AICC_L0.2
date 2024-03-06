// memory-mapped I/O addresses
# GPIO_SWs   = 0x80001400
# GPIO_LEDs  = 0x80001404
# GPIO_INOUT = 0x80001408

.globl main


main:
  li t0, 0x80001400 
  li t1, 0xFFFF

  sw t1, 8(t0)  



  li t4, 0xFFFF

  li s3, 0
  li s4, 1000000

repeat:  
  li s0, 1 # cantidad de led
  li s1, 0x1 # posicion del led

  li t2, 0x0001
  li t3, 0x8000
L0:
  
  sw s1, 4(t0) # en la posicion del led

  slli s1, s1, 1     # muevo un led a la derecha
  
F0:
  addi s3,s3,1  
  bne s3,s4,F0
  li s3,0

  blt s1,t3, L0
L1:
  sw s1, 4(t0) # en la posicion del led

  srli s1, s1, 1     # muevo un led a la derecha

F1:
  addi s3,s3,1  
  bne s3,s4,F1
  li s3,0

  bge s1,t2, L1
  slli t2, t2, 1

  slli s1, s1, 1
  addi s1,s1, 1
  bne s1, t4, L0

  j repeat