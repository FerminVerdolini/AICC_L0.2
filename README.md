## AICC_L0.2

# Ensamblador RISC-V

### Ejercicio 1

Escriba un programa en ensamblador de RISC-V que proyecte el valor de los interruptores en los LEDs. Ese valor se mantiene durante un tiempo tras el cual los LEDs se apagan, y se repite el proceso. El valor debe encenderse y apagarse lo suficientemente lento como para que una persona pueda ver el parpadeo. Guarde el programa como **`FlashSwitchesToLEDs.S`**.

### Ejercicio 2

Escriba un programa en ensamblador de RISC-V que muestre el valor inverso de los interruptores en los LEDs. Por ejemplo, si los interruptores son (en binario): `01010101010101`, entonces los LEDs deberían mostrar: `101010101010101010`; si los interruptores son: `1111000011110000` , entonces en los LEDs debería aparecer: `0000111100001111`; y así sucesivamente. Use **`DisplayInverse.S`** como nombre para el programa.

### Ejercicio 3

Escriba un programa en ensamblador de RISC-V que desplace un número creciente de LEDs encendidos hacia adelante y hacia atrás hasta que todos los LEDs estén encendidos. Entonces el patrón debe repetirse. Guarde el programa como **`ScrollLEDs.S`**.
El programa debería realizar lo siguiente:

1. Primero, un LED encendido debe desplazarse de derecha a izquierda y luego de izquierda a derecha.

2. A continuación, dos LEDs encendidos deben desplazarse de derecha a izquierda y luego de izquierda a derecha.

3. Después tres LEDs encendidos deben desplazarse de derecha a izquierda y luego de izquierda a derecha.

4. Y así sucesivamente, hasta que todos los LEDs se encienden.

5. A continuación, el patrón debe repetirse.

### Ejercicio 4

Escriba un programa en ensamblador de RISC-V que muestre el resultado de la suma (4 bits sin signo) de los 4 bits menos significativos de los interruptores con los 4 bits más significativos de los mismos. El resultado se debe mostrar en los 4 bits menos significativos (más a la derecha) de los LEDs. Guarde el programa como **`4bitAdd.S`**. El quinto bit de los LEDs debería encenderse cuando se produzca un desborde sin signo (es decir, cuando el acarreo de salida es 1).
