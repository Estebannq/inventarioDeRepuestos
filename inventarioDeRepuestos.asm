.data 0x10010000

mensaje: .asciiz "\nReferencia "
rango:   .asciiz " (0 a 200): "
error:   .asciiz "\nError: ingrese un valor entre 0 y 200.\n"

.data 0x10010100
promedio: .asciiz "\nPromedio entero: "

.data 0x10010200
maximo: .asciiz "\nValor maximo: "

.data 0x10010300
cantidad: .asciiz "\nReferencias con menos de 10 unidades: "

.text
.globl main

main:

    # se inicializan los registros
    addi $t0, $zero, 0
    addi $t2, $zero, 0
    addi $t3, $zero, 0
    addi $t4, $zero, 0
    addi $t6, $zero, 5

ciclo:

    # se verifica si ya se ingresaron 5 datos
    beq $t0, $t6, resultados
    sll $zero, $zero, 0

    # se imprime mensaje de referencia
    addi $v0, $zero, 4
    lui $a0, 0x1001
    ori $a0, $a0, 0
    syscall

    # se imprime numero de referencia actual
    addi $t8, $t0, 1
    addi $v0, $zero, 1
    addu $a0, $t8, $zero
    syscall

    # se imprime rango permitido
    addi $v0, $zero, 4
    lui $a0, 0x1001
    ori $a0, $a0, 13
    syscall

    # Leer cantidad ingresada
    addi $v0, $zero, 5
    syscall
    addu $t1, $v0, $zero

    # Validar si el dato es menor que 0
    slt $t5, $t1, $zero
    bne $t5, $zero, invalido
    sll $zero, $zero, 0

    # Validar si el dato es mayor que 200
    slti $t5, $t1, 201
    beq $t5, $zero, invalido
    sll $zero, $zero, 0

    # Acumula la cantidad
    addu $t2, $t2, $t1

    # Comparar con el valor maximo
    slt $t5, $t3, $t1
    beq $t5, $zero, verificar
    sll $zero, $zero, 0

    # Actualizar valor maximo
    addu $t3, $t1, $zero

verificar:

    # Verificar si la cantidad es menor que 10
    slti $t5, $t1, 10
    beq $t5, $zero, continuar
    sll $zero, $zero, 0

    # Aumentar contador de referencias
    addi $t4, $t4, 1

continuar:

    # Aumentar contador de datos validos
    addi $t0, $t0, 1

    # Volver al ciclo
    j ciclo
    sll $zero, $zero, 0

invalido:

    # Mostrar mensaje de error
    addi $v0, $zero, 4
    lui $a0, 0x1001
    ori $a0, $a0, 26
    syscall

    # Solicitar nuevamente el mismo dato
    j ciclo
    sll $zero, $zero, 0

resultados:

    # Calcular promedio entero
    div $t2, $t6
    mflo $t7

    # Mostrar mensaje del promedio
    addi $v0, $zero, 4
    lui $a0, 0x1001
    ori $a0, $a0, 0x0100
    syscall

    # Mostrar promedio
    addi $v0, $zero, 1
    addu $a0, $t7, $zero
    syscall

    # Mostrar mensaje del maximo
    addi $v0, $zero, 4
    lui $a0, 0x1001
    ori $a0, $a0, 0x0200
    syscall

    # Mostrar valor maximo
    addi $v0, $zero, 1
    addu $a0, $t3, $zero
    syscall

    # Mostrar mensaje de referencias
    addi $v0, $zero, 4
    lui $a0, 0x1001
    ori $a0, $a0, 0x0300
    syscall

    # Mostrar cantidad de referencias
    addi $v0, $zero, 1
    addu $a0, $t4, $zero
    syscall

    # Finalizar programa
    addi $v0, $zero, 10
    syscall