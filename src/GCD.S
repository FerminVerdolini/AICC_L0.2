/*
    Escriba un programa en ensamblador de RISC-V que encuentre el máximo
    común divisor de dos números, a y b, según el algoritmo de Euclides. Los valores a y b
    deben ser variables definidas estáticamente en el programa. Guarde el programa como
    GCD.S. En el siguiente enlace se proporciona información adicional sobre el algoritmo de
    Euclides: https://www.khanacademy.org/computing/computerscience/cryptography/modarithmetic/a/the-euclidean-algorithm. También puede simplemente
    buscar en Google "Algoritmo de Euclides".
*/

main:
    li t0, 80       	    # Cargo t0 con un número arbitrario
    li t1, 5		    # Cargo t1 con un número arbitrario

gcd:
    beq t1, 0, end	    # Si t2 == 0, salto a end 
    mv t3, t0		    # Si t2 != 0, utilizo t3 como auxiliar
    mv t0, t1	            # para aplicar el algoritmo de Euclides
    mv t1, t3%t1
    j gcd
end: mv t2, t0
