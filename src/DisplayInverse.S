/*
    Escriba un programa en ensamblador de RISC-V que muestre el valor inverso 
    de los interruptores en los LEDs. Por ejemplo, si los interruptores son (en binario):
    01010101010101, entonces los LEDs deberían mostrar: 101010101010101010; si los
    interruptores son: 1111000011110000, entonces en los LEDs debería aparecer:
    0000111100001111; y así sucesivamente. Use DisplayInverse.S como nombre para el programa.
*/

// memory-mapped I/O addresses
# GPIO_SWs   = 0x80001400
# GPIO_LEDs  = 0x80001404
# GPIO_INOUT = 0x80001408

.globl main

main:
    li t0, 0x80001400       # Direccion base de los GPIO
    li t1, 0xFFFF           # Mascaras para los 16 interruptores
                            # switches  (inputs=0)
                            # LEDS      (outputs=1)
    sw t1, 8(t0)            # GPIO_INOUT = 0xFFFF
    
    addi s0, zero, 0        # Inicializar el contador i = 0
    addi s1, zero, 10000000 # Inicializar el contador j = 10e6

repeat:
    lw t2, 0(t0)            # Leer el valor de los interruptores
    no t3, t2		    # t3 = ~t2
    sw t3, 4(t0)            # Escribir el valor de los interruptores negados en los LEDs

L0: addi s0, s0, 1          # Incrementar el contador i
    bne s0, s1, L0          # Si i != 10e6, repetir el ciclo

    sw zero, 4(t0)          # Apagar los LEDs

    addi s0, zero, 0        # Reiniciar el contador i = 0
    addi s1, zero, 10000000 # Reiniciar el contador j = 10e6

    j repeat                # Repetir el ciclo
