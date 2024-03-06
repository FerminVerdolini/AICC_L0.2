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
    li t4, 0xFFFFFFFF       # Mascaras para invertir la lectura con una xor
repeat:
    lw t2, 0(t0)            # Leer el valor de los interruptores
    srli t2, t2, 16         # Desplazar 16 bits a la derecha para obtener solo los interruptores
    xor t3, t2, t4          # Invertir el valor de los interruptores
    sw t3, 4(t0)            # Escribir el valor de los interruptores negados en los LEDs

    j repeat                # Repetir el ciclo
