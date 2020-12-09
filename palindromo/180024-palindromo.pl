#!/usr/bin/perl

 # ***************************************************************************
 #  Nombre:		Julieta Rodríguez Espiricueta
 #  Carrera:		Ingeniería en Tecnologías de la Información (ITI)
 #  Profesor:		Juan Carlos González Ibarra
 #  Institución:	Universidad Politécnica de San Luis Potosí
 #  Matrícula:		180024
 #
 #  Descripción:	Programa que comprueba si la cadena ingresada
 #                      es o no un palíndromo
 #
 #****************************************************************************

use strict;                     
use warnings;
use feature "say";

#  Función que retorna el primer caracter de la cadena
sub primerCaracter {
    my ( $cadena ) = @_;		# |  Paso del parámetro
    my $str = substr( $cadena, 0, 1 );
    return $str;
}

#  Función que retorna el último caracter de la cadena
sub ultimoCaracter {
    my ( $cadena ) = @_;		# |  Paso del parámetro
    my $str = substr( $cadena, -1 );
    return $str;
}

#  Función que retorna la cadena que resulta al remover el primer y último caracter de la cadena
sub mitadCaracteres {
    my ( $cadena ) = @_;		# |  Paso del parámetro
    my $str = substr( $cadena, 1, -1 );
    return $str;
}

#  Función que permite determinar si la cadena ingresada es un palíndromo
sub esPalindromo {
    my ( $cadena ) = @_;		# |  Paso del parámetro
    
    #  Si la cadena es tiene 1 o menos caracteres, es palíndromo
    if ( length($cadena) <= 1 ) {
        return 1;
    }
    
    #  Si el primer y último caracter de la cadena son diferentes, entonces la cadena no es un palíndromo
    if ( &primerCaracter($cadena) ne &ultimoCaracter($cadena) ) {
        return 0;
    }
    
    #  Caso recursivo que compara la cadena restante de quitar el primer y último caracter
    return &esPalindromo( &mitadCaracteres( $cadena ) );
}

#  Función que muestra el resultado de la función esPalindromo()
sub comprobarPalindromo {
    my ( $cadena ) = @_;		# |  Paso del parámetro
    
    #  Si se cumplen las condiciones, la cadena es un palíndromo
    if ( &esPalindromo( $cadena ) ) {
        say "  -> Si, es un palindromo\n";
    }
    #  Si las condiciones no se cumple, no es un palíndromo
    else {
        say "  -> No, no es un palindromo\n";
    }
}

#  .: MAIN :.  #
print "Ingrese la cadena a comprobar: ";
my $cadena = <STDIN>;                             # |  Captura de la cadena por teclado
chomp $cadena;                                    # |  Se le quita el salto de línea
say "\nLa cadena <$cadena> es un palindromo? ";   # |  Se imprime la cadena original
$cadena =~ s/\s//g;                               # |  Se quitan los espacios en blanco
$cadena = uc( $cadena );                          # |  La cadena se pasa a mayúsculas

&comprobarPalindromo ( $cadena );                 # |  Se comprueba la cadena ingresada
