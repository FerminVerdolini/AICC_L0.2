/*
    Escriba un programa en ensamblador de RISC-V que muestre el resultado 
    de la suma (4 bits sin signo) de los 4 bits menos significativos de los 
    interruptores con los 4 bits más significativos de los mismos. 
    El resultado se debe mostrar en los 4 bits menos significativos 
    (más a la derecha) de los LEDs. Guarde el programa como 4bitAdd.S. 
    El quinto bit de los LEDs debería encenderse cuando se produzca 
    un desborde sin signo (es decir, cuando el acarreo de salida es 1).
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

    li s0, 0x10             # Máscara para el bit 5 de los LEDs

    loop:
        lw      t2, 0(t0)       # Leer el valor de los interruptores
        srli    t2, t2, 16      # Desplazar 16 bits a la derecha para obtener solo los interruptores
        and     t3, t2, 0x0F    # Tomar los 4 bits menos significativos. Se guardan en t3
        and     t2, t2, 0xF0    # Tomar los 4 bits más significativos   
        srli    t4, t2, 0x4     # Desplazar los 4 bits más significativos a la derecha
        add     t5, t3, t4      # Sumar los 4 bits menos significativos con los 4 bits más significativos. Se guarda en t5
        sw      t5, 4(t0)       # Mostrar el resultado en los LEDs. 
        
        j loop                  # Repetir el proceso
    
