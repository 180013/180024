#!/usr/bin/perl

 # ***************************************************************************
 #  Nombre:		Julieta Rodríguez Espiricueta
 #  Carrera:		Ingeniería en Tecnologías de la Información (ITI)
 #  Profesor:		Juan Carlos González Ibarra
 #  Institución:	Universidad Politécnica de San Luis Potosí
 #  Matrícula:		180024
 #
 #  Descripción:	Programa que recrea el comportamiento de un
 #			autómata de pila (PDA) con la expresión anbn
 #
 #****************************************************************************

use strict;                     
use warnings;
use feature "say";        		# |  Característica de Perl que imprime un salto de línea automático

#  Variables globales
use vars qw ( $simbolo );		#  Define el símbolo actual
use vars qw ( $fin );			#  Marca el fin de cadena
use vars qw ( @pila );			#  Define la pila a utilizar
use vars qw ( $a );			#  Contador de a
use vars qw ( $b );			#  Contador de b

$a = 0;
$b = 0;
@pila = "";				# |  Se inicializa la pila

#  Función que valida que solo se ingresen las letras a y b
sub caracter {
	my ( $character ) = @_;		# |  Paso del parámetro
	
	$simbolo = " ";			# |  Las variables globales se conforman
	$fin = " ";			# |  por un espacio en blanco
	
	#  Valida que el caracter sea una a
	if ( $character =~ m[a] ) {
		$simbolo = "   a    ";
		$a++;
		return 0;
	}
	#  Valida que el caracter sea una b
	elsif ( $character =~ m[b] ) {
		$simbolo = "   b    ";
		$b++;
		return 1;
	}
	#  Valida que sea fin de cadena
	elsif ( $character eq $fin ) {
		return 2;
	}
	#  Si no se cumple ninguna de las anteriores, es un caracter no válido
	else {
		say ( "El caracter $character no es valido\n" );
		exit ();
	}
}

#  Función para el encabezado de la tabla
sub encabezado {
	say ("|  Edo. Actual |Caracter |  Simbolo  |Edo. Siguiente |");
	&cuerpo;
}

#  Función que guarda cada valor despues de encontrarlo en un ciclo
sub contenido {
	my ( $estadosig, $character, $simbolo, $estado, @pila ) = @_;
	say ("|       $estadosig      |    $character    | $simbolo  |       $estado       | [@pila]");
	&cuerpo;
}

#  Función que muestra la línea que se repetirá cada vez que la mandemos llamar
sub cuerpo {
	say ("+--------------+---------+-----------+---------------+");
}

#  .: MAIN :.  #
#  Esta es la tabla de transiciones del automata AFN creado
#		a | b | Vacío
my @tabla = ( 	[0, 1, 2],	# |  q0
		[1, 2, 2],	# |  q1
		[2, 2, 2] );	# |  q2

my $estado = 0;	#  El estado se define inicialmente en 0

say ("     .: Automata de Pila que \n     valida la expresion anbn :.");
say ("+-------------------------------------+");
say ("|    Ingrese una cadena a evaluar:    |");
say ("+-------------------------------------+");
my $cadena = <STDIN>;                             # |  Captura de la cadena por teclado
chomp $cadena;                                    # |  Se le quita el salto de línea
my @cadena = split (//, $cadena);	# |  La cadena se convierte en un arreglo

&cuerpo;
&encabezado;

my $charcaracter = 0;	#  Se inicializa la variable para validar los caracteres ingresados
my $bandera = 0;		#  Valida que empiece a vaciarse la pila

#  Ciclo para recorrer la cadena
for my $character (@cadena) {
	my $estadosig = $estado;
	
	#  Llamada a la función para saber si es un caracter válido
	my $charcaracter = &caracter ( $character );
	
	#  Se guarda el valor obtenido en la tabla según las coordenadas recibidas
	$estado = $tabla [$estado][$charcaracter];
	
	#  Se llena la pila según las letras "a" ingresadas
	if ( $charcaracter == 0 and $bandera == 0 ) {
		push( @pila," x " );
	}
	
	#  Si se detecta una letra "b", se empieza a vaciar la pila
	if ( $charcaracter == 1 ) {
		pop @pila;
		$bandera = 1;
	}
	
	#  Si se ingresa una "a" después de haber sido detectada una "b", entonces la cadena es inválida
	if ( $charcaracter == 0 and $bandera == 1 ) {
		say ("|       ",$estado,"      |         | Fin cadena|               |");
		&cuerpo;
		say "|              Cadena no valida :(                   |";
		say ("+----------------------------------------------------+");
		exit ();
	}
	
	#  Se imprime la información de la pila
	&contenido ($estadosig, $character, $simbolo, $estado, @pila);
}

#  Si la cantidad de "a's" y de "b's" no es igual, la cadena es inválida
if ( $a != $b ) {
	say ("|       ",$estado,"      |         | Fin cadena|               |");
	&cuerpo;
	say "|              Cadena no valida :(                   |";
	say ("+----------------------------------------------------+");
} 
#  De lo contrario, la cadena si es válida
else {
	say ("|       ",$estado,"      |         | Fin cadena|               |");
	&cuerpo;
	say ("|                Cadena valida                       |");
	say ("+----------------------------------------------------+");
}
