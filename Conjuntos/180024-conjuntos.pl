#!/usr/bin/perl

 # ***************************************************************************
 #  Nombre:		Julieta Rodríguez Espiricueta
 #  Carrera:		Ingeniería en Tecnologías de la Información (ITI)
 #  Profesor:		Juan Carlos González Ibarra
 #  Institución:	Universidad Politécnica de San Luis Potosí
 #  Matrícula:		180024
 #
 #  Descripción:       Programa para realizar diferentes operaciones de
 #                              conjuntos como en matemáticas.
 #
 #****************************************************************************

use strict;                     
use warnings;

use Set::Scalar;                #  Refiere a un módulo de Perl necesario para poder operar con conjuntos
use feature "say";              #  Refiere a una característica de Perl que imprime un salto de línea automático

#  Se definen 3 conjuntos globales
my $A = Set::Scalar -> new ( 1, 2, 3, 4, 5 );
my $B = Set::Scalar -> new ( 3, 4, 5, 6, 7 );
my $C = Set::Scalar -> new ( );

#  Impresión de los conjuntos iniciales
say "El conjunto A es: $A";
say "El conjunto B es: $B";
say "El conjunto C es: $C";

# %%
# Pertenencia
sub pertenencia {
    #  Se define un conjunto local
	my $A = Set::Scalar -> new ( 1, 2, 3, 4, 5 );
	my $result;
	
   #******************************************************
   #  Debido a que Perl no imprime como tal "True"
   #  o "False", se estructuró una condicional para
   #  visualizar el resultado arrojado en cada caso.
   #******************************************************
	
    # 1 está en A
	$result = $A -> has ( 1 );      #  La función "has" también puede
	if ($result == 1) {             #  escribirse como "contains".
		say "True";
	} else {say "False";}
    
    # 1 no está en A
	$result = $A -> has ( 1 );
	if ($result != 1) {
	        say "True";
	} else {say "False";}

    # 10 está en A
        $result = $A -> has ( 10 );
	if ($result == 1) {
	        say "True";
	} else {say "False";}

    # 10 no está en A 
        $result = $A -> has ( 10 );
	if ($result != 1) {
	        say "True";
	} else {say "False";}
}

# %%
# Convertir a un conjunto
sub transformarConj {
        my @A = ( 1, 2, 3 );                          #  Se define una lista
	my $conjuntoA = Set::Scalar -> new ( @A );    #  Se transforma a un conjunto
        say "El conjunto A es: $conjuntoA";           #  Se imprime el resultado
        
        my @B = ( 1, 2, 3, 4, 5 );                    #  Se define un array
	my $conjuntoB = Set::Scalar -> new ( @B );    #  Se transforma a un conjunto
        say "El conjunto B es: $conjuntoB";           #  Se imprime el resultado
        
        my $C = 'Hola Mundo';                           #  Se define una cadena
	my $conjuntoC = Set::Scalar -> new ( $C );      #  Se transforma en un conjunto
        say "El conjunto C es: $conjuntoC";             #  Se imprime en el resultado
}

# %%
# Quitar un elemento al conjunto
sub quitar {
	my $A = Set::Scalar -> new ( 0, 1, 2, 3, 4, 5 );
	$A -> delete ( 2 );
	say "El conjunto despues de eliminar: $A";
}

# %%
# Quitar todos los elementos de un conjunto
sub clearSet {
        my $A = Set::Scalar -> new ( 0, 1, 2, 3, 4, 5 );
	$A -> clear;
	say "El conjunto eliminado: $A";
}

# %%
# Copiar un conjunto
sub copiar {
        my $A = Set::Scalar -> new ( 1, 2, 3, 4, 5 );
        my $B = $A -> copy;
	say "Conjunto A = $A comparado al Conjunto B = $B";
}

# %%
# Agregar un elemento
sub agregar {
        $B -> insert ( 987 );
        say "El nuevo conjunto B = $B";
}

# %%
# Unión
sub union {
        my $A = Set::Scalar -> new ( 1, 2, 3, 4, 5 );
        my $B = Set::Scalar -> new ( 3, 4, 5, 6, 7 );
        
     # Unión de A y B
        my $U = $A -> union ( $B );     #  Variable que guarda el resultado de la unión
        say "La union = $U";
        $U = $A + $B;
        say "La union = $U";
}

# %%
# Interseccion
sub intereseccion {
        my $A = Set::Scalar -> new ( 1, 2, 3, 4, 5 );
        my $B = Set::Scalar -> new ( 3, 4, 5, 6, 7 );
        
     # Intersección de A y B
        my $I = $A -> intersection ( $B );     #  Variable que guarda el resultado de la intersección
        say "La interseccion = $I";
        $I = $A * $B;
        say "La interseccion = $I";
}

# %%
# Diferencia
sub diferencia {
        my $A = Set::Scalar -> new ( 1, 2, 3, 4, 5 );
        my $B = Set::Scalar -> new ( 3, 4, 5, 6, 7 );
        
     # Diferencia entre A y B
        my $D = $A -> difference ( $B );     #  Variable que guarda el resultado de la diferencia
        say "La diferencia = $D";
        $D = $A - $B;
        say "La diferencia = $D";
}

# %%
# Diferencia simétrica
sub simetrica {
        my $A = Set::Scalar -> new ( 1, 2, 3, 4, 5 );
        my $B = Set::Scalar -> new ( 3, 4, 5, 6, 7 );
        my $C = Set::Scalar -> new ( );
        
        my $S = $A % $B;                            #  Variable que guarda el resultado de la diferencia simétrica
        say "La diferencia simetrica = $S";
        $S = $A -> symmetric_difference ( $B );     # Diferencia simétrica de A y B
        say "La diferencia simetrica = $S";
        $S = $B -> symmetric_difference ( $A );     # Diferencia simétrica de B y A
        say "La diferencia simetrica = $S";
        $S = $A -> symmetric_difference ( $C );     # Diferencia simétrica de A y C
        say "La diferencia simetrica = $S";
        $S = $B -> symmetric_difference ( $C );     # Diferencia simétrica de B y C
        say "La diferencia simetrica = $S";
}

# %%
# Subconjunto
sub subconjunto {
        my $B = Set::Scalar -> new ( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 );
        my $A = Set::Scalar -> new ( 1, 2, 3, 4, 5 );
        
     # A es subconjunto de B
        my $subConj = $A -> is_subset ( $B );     #  Variable que guarda el resultado del subconjunto
        print "El subconjunto = ";
        if ($subConj == 1) {                      #  Se retoma la estructura condicional para
	        say "True";                       #  imprimir un resultado "True" o "False"
	} else {say "False";}
	
     # B es subconjunto de A
        $subConj = $B -> is_subset ( $A );
        print "El subconjunto = ";
        if ($subConj == 1) {
	        say "True";
	} else {say "False";}
}

# %%
# Superconjunto
sub superconjunto {
        my $B = Set::Scalar -> new ( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 );
        my $A = Set::Scalar -> new ( 1, 2, 3, 4, 5 );
        
     # B es superconjunto de A
        my $superConj = $B -> is_superset ( $A );       #  Variable que guarda el resultado del superconjunto
        print "El superconjunto = ";
        if ($superConj == 1) {                          #  Se retoma la estructura condicional para
	        say "True";                             #  imprimir un resultado "True" o "False"
	} else {say "False";}
	
     # A es superconjunto de B
        $superConj = $A -> is_superset ( $B );
        print "El superconjunto = ";
        if ($superConj == 1) {
	        say "True";
	} else {say "False";}
}

# %%
# Llamada a todas las funciones
say "\n.:Pertenencia:.";
&pertenencia;

say "\n.:Transformar a un conjunto:.";
&transformarConj;

say "\n.:Eliminar un elemento:.";
&quitar;

say "\n.:Eliminar todos los elementos:.";
&clearSet;

say "\n.:Copiar un conjunto:.";
&copiar;

say "\n.:Agregar un elemento:.";
&agregar;

say "\n.:Union:.";
&union;

say "\n.:Interseccion:.";
&intereseccion;

say "\n.:Diferencia:.";
&diferencia;

say "\n.:Diferencia simetrica:.";
&simetrica;

say "\n.:Subconjunto:.";
&subconjunto;

say "\n.:Superconjunto:.";
&superconjunto;

say "";  #  Salto final de línea
