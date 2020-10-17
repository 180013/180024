#!/usr/bin/perl

 # **************************************************************************************
 #  Nombre:		Julieta Rodríguez Espiricueta ft. Diana Rodríguez Espiricueta
 #  Carrera:		Ingeniería en Tecnologías de la Información (ITI)
 #  Profesor:		Juan Carlos González Ibarra
 #  Institución:	Universidad Politécnica de San Luis Potosí
 #  Matrícula:		180024
 #
 #  Descripción:	Programa que recrea el funcionamiento de un
 #			autómata finito no determinista (AFN)
 #
 #  Código hecho en colaboración con Diana Rodríguez Espiricueta (170010)
 # **************************************************************************************

use strict;                     
use warnings;
use feature "say";        		# |  Característica de Perl que imprime un salto de línea automático

use vars qw ( $simbolo );		# |  Variable global
use vars qw ( $fin );			# |  Variable global

$simbolo = " ";				# |  Se inicializa con un espacio vacío
$fin = " ";				# |  Se inicializa con un espacio vacío

sub caracter {
	my ( $character ) = @_;		# |  Paso del parámetro
	
	$simbolo = " ";			# |  Las variables globales se conforman
	$fin = " ";			# |  por un espacio en blanco
	
	#  Valida que el caracter sea una a
	if ( $character =~ m[a] ) {
		$simbolo = "   a    ";
		return 0;
	}
	#  Valida que el caracter sea una b
	elsif ( $character =~ m[b] ) {
		$simbolo = "   b    ";
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
	my ( $estadosig, $character, $simbolo, $estado ) = @_;
	say ("|       $estadosig      |    $character    | $simbolo  |       $estado       |");
	&cuerpo;
}

#  Función que muestra la línea que se repetirá cada vez que la mandemos llamar
sub cuerpo {
	say ("+--------------+---------+-----------+---------------+");
}

#  MAIN
#  Esta es la tabla de transiciones del automata AFN creado
#		a | b | Vacío
my @tabla = ( 	[1, 5, 20],	# |  q0
		[2, 5, 20],	# |  q1
		[3, 5, 20],	# |  q2
		[4, 5, 20],	# |  q3
		[1, 5, 20],	# |  q4
		[6, 20, 21],	# |  q5
		[7, 20, 21],	# |  q6
		[8, 20, 21],	# |  q7
		[9, 20, 21],	# |  q8
		[10, 20, 21],	# |  q9
		[11, 20, 21],	# |  q10
		[7, 20, 21] );	# |  q11
my $estado = 0;

say ("+-------------------------------------+");
say ("|    Ingrese una cadena a evaluar:    |");
say ("+-------------------------------------+");
	
my $caden = <STDIN>;			# |  Captura de la cadena por teclado
chomp $caden;				# |  Se le quita el salto de línea
my $cadena = $caden . " ";		# |  Se le concatena un espacio vacío al final
my @cadena = split (//, $cadena);	# |  La cadena se convierte en un arreglo

&cuerpo;
&encabezado;

my $charcaracter = 0;
my $x = 0;	# |  Valida que la impresión de los primeros estados con a*
my $y = 5;	# |  Valida que la impresión de los últimos estados con a*
my $b = 0;	# |  Valida que ya se haya impreso la b

#  Ciclo para recorrer la cadena
for my $character (@cadena) {
	my $estadosig = $estado;
	my $i = 0;
	
	#  Llamada a la función para saber si es un caracter válido
	my $charcaracter = &caracter ( $character );
	
	#  Se guarda el valor obtenido en la tabla según las coordenadas recibidas
	$estado = $tabla [$estado][$charcaracter];
	
	#  Se cuenta el número de "a", y si son 4 y la b aún no se imprime,
	#  se establece el estado siguiente como 4
	if ( $x == 4 and $b == 0 ) {
		$estadosig = 4;
	}
	
	#  Se cuentan cuántas "a" han sido impresas, hasta un máximo de 4
	if ( $character eq "a" and $x < 4 ) {
		$x = ($x + 1);
		&contenido ($estadosig, $character, $simbolo, $estado);
	}
	
	#  Se llenan los espacios vacíos si aún no se imprime el número
	#  máximo de "a" pero ya se detectó que el estado siguiente es 5
	if ( $x < 4 and $estado == 5 ) {
		for ( $i = $x; $i < 4; $i++ ) {
			&contenido ( $i, " ", "        ", ($i + 1) );
		}
		$estadosig = 4;
	}
	
	#  Si se detecta el caracter "b", se cambian los valores de las
	#  varibles: b=1 y x=4. Esto indica que esos lugares ya fueron
	#  llenados por letras "a" o por vacíos
	if ( $character eq "b" ) {
		$b = 1;
		&contenido ($estadosig, $character, $simbolo, $estado);
		$x = 4;
	}
	
	#  Si "b" ya fue impresa y se detecta un caracter "a", se llenan
	#  los espacios que le siguen en la tabla
	if ( $character eq "a" and $b == 1 and $y != 11 ) {
		$y = ( $y+1 );
		&contenido ($estadosig, $character, $simbolo, $estado);
	}
	
	#  Si se detecta que el estado siguiente ya es el final y que aún
	#  no se tiene el número máximo de "a", se llenarán con vacíos
	if ( $y < 11 and $estado == 21 ) {
		for ( $i = $y; $i < 11; $i++ ) {
			&contenido ( $i, " ", "        ", ($i + 1) );
		}
		$estadosig = 11;
	}
	
	#  Si es estado no llega al estado final, la cadena no es válida
	if ( $estado == 20 ) {
		&cuerpo;
		say "|              Cadena no valida :(                   |";
		say ("+----------------------------------------------------+");
		exit ();
	}
}

#  Al concluir, si el estado no es 11 (que es el estado de aceptación, y
#  en la tabla se representa con un 21), se imprime "Cadena no válida"
if ( not ( $estado == 21 ) ) {
	say "|              Cadena no valida :(                   |";
	say ("+----------------------------------------------------+");
}

#  Si el estado es 11, es una cadena válida
if ( $estado == 21 ) {
	say ("|       11     |         | Fin cadena|               |");
	&cuerpo;
	say ("|                Cadena valida                       |");
	say ("+----------------------------------------------------+");
}
