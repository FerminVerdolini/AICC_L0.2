/*
    Escriba un programa en ensamblador de RISC-V que proyecte el valor de los
    interruptores en los LEDs. Ese valor se mantiene durante un tiempo tras el cual los LEDs se
    apagan, y se repite el proceso. El valor debe encenderse y apagarse lo suficientemente
    lento como para que una persona pueda ver el parpadeo.
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
    sw t2, 4(t0)            # Escribir el valor de los interruptores en los LEDs

L0: addi s0, s0, 1         # Incrementar el contador i
    bne s0, s1, L0          # Si i != 100, repetir el ciclo

    sw zero, 4(t0)          # Apagar los LEDs

    addi s0, zero, 0        # Reiniciar el contador i = 0
    addi s1, zero, 100      # Reiniciar el contador j = 100

    j repeat                # Repetir el ciclo