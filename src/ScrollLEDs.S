// memory-mapped I/O addresses
# GPIO_SWs   = 0x80001400
# GPIO_LEDs  = 0x80001404
# GPIO_INOUT = 0x80001408

.globl main


main:
  li t0, 0x80001400 # base address of GPIO memory-mapped registers
  li t1, 0xFFFF     # set direction of GPIOs  

  sw t1, 8(t0)      # GPIO_INOUT = 0xFFFF

  li s0, 0          # Iterador del delay
  li s1, 1000000    # Limite del delay

  li s2, 0xFFFF     # Valor de control final, 
                    # todos los leds encendidos  

  li s3, 0x8000     # valor de control del ultimo led activo

repeat:  
  li s4, 0x0001     # valor de control del primer led activo
                    # este valor cambia a medida que se agregan leds

  li s5, 0x1        # Valor auxiliar del registro de led
                    # Comienza en 1
L0:
  
  sw s5, 4(t0)      # Cargo el valor de los led activos

  slli s5, s5, 1    # muevo un led a la derecha
  
Delay0:
  addi s0,s0,1  
  bne s0,s1,Delay0 
  li s0,0

  blt s5,s3, L0     # si el led no es el ultimo vuelvo a rotar
L1:                 # si llego al final tengo que volver al otro lado
  sw s5, 4(t0)      # Cargo el valor de los led activos

  srli s5, s5, 1    # muevo un led a la izquierda
Delay1:
  addi s0,s0,1  
  bne s0,s1,Delay1
  li s0,0

  bge s5,s4, L1     # si el led no es el ultimo vuelvo a rotar
  slli s4, s4, 1    # aumento el limite inferior para tener un led mas

  slli s5, s5, 1    
  addi s5, s5, 1    # roto el valor de los led y le sumo uno
                    # para pasar de 1 a 3, de 3 a 7, de 7 a 15, etc 
  bne  s5, s2, L0   # si no estan todos los leds activos repito
                    # si todos los leds se activan empiezo de 0

  j repeat