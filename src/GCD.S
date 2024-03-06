  /*
    Escriba un programa en ensamblador de RISC-V que encuentre el máximo
    común divisor de dos números, a y b, según el algoritmo de Euclides. Los valores a y b
    deben ser variables definidas estáticamente en el programa. Guarde el programa como
    GCD.S. En el siguiente enlace se proporciona información adicional sobre el algoritmo de
    Euclides: https://www.khanacademy.org/computing/computerscience/cryptography/modarithmetic/a/the-euclidean-algorithm. También puede simplemente
    buscar en Google "Algoritmo de Euclides".
*/

.globl main

main:
    li t0, 80       	    # Cargo t0 con un número arbitrario
    li t1, 5		        # Cargo t1 con un número arbitrario 
                            # Cargo numeros arbitrarios para la comprobacion del programa con el debuger

gcd:
    beq     t1, zero, end	# Si t2 == 0, salto a end
    mv      t3, t0		    # Si t2 != 0, utilizo t3 como auxiliar
    mv      t0, t1	        # para aplicar el algoritmo de Euclides
    rem     t2, t3, t1      # Guardo el residuo de la division en t2
    mv      t1, t2          # Guardo el valor de t2 en t1 para la siguiente iteracion
    j       gcd             # Salto a gcd para repetir el algoritmo

end:
    mv     t2, t0           # Guardo el resultado de la operacion en t2