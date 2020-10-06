#!/usr/bin/perl

 # ***************************************************************************
 #  Nombre:		Julieta Rodríguez Espiricueta
 #  Carrera:		Ingeniería en Tecnologías de la Información (ITI)
 #  Profesor:		Juan Carlos González Ibarra
 #  Institución:	Universidad Politécnica de San Luis Potosí
 #  Matrícula:		180024
 #
 #  Descripción:	Programa que recrea el funcionamiento de un
 #			autómata finito determinista (AFD)
 #
 #****************************************************************************

use strict;                     
use warnings;
use feature "say";        		# |  Característica de Perl que imprime un salto de línea automático

use vars qw ( $simbolo );		# |  Variable global
use vars qw ( $fin );			# |  Variable global

$simbolo = undef;			# | Se inicializa sin un valor
$fin = undef;				# | Se inicializa sin un valor

sub caracter {
	my ( $character ) = @_;		# |  Paso del parámetro
	
	$simbolo = "";			# |  Las variables globales están vacías
	$fin = "";
	
	if ($character =~ /^\d+$/) {		# |  El comando \d reconoce los dígitos
		$simbolo = " Digito ";
		return 0;
	} else {
		# |  Se validan los operadores permitidos (+, -, *, /)
		if ( $character =~ /\+|\-/ or $character eq "*" or $character eq "/") {
			$simbolo = "Operador";
			return 1;
		}else{
			if ( $character eq $fin ) {
				return 2;
			}
		}
		#say ( "El caracter $character no es valido\n" );
		#exit ();
		
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
	say ("|     ",$estadosig,"      |  ",$character,"    |",$simbolo," |     ",$estado,"       |");
	&cuerpo;
}

#  Función que muestra la línea que se repetirá cada vez que la mandemos llamar
sub cuerpo {
	say ("+--------------+---------+-----------+---------------+");
}

#  MAIN
#  Este es la tabla de transiciones del automata AFD creado
my @tabla= ([1,"E","E"],["E",2,"E"],[3,"E","E"],["E","E","A"]);	# |  Toma los valores del return
my $estado = 0;

say ("+-------------------------------------+");
say ("|    Ingrese una cadena a evaluar:    |");
say ("+-------------------------------------+");
	
my $cadena = <STDIN>;			# |  Captura de la cadena por teclado
chomp $cadena;				# |  Se elimina la reserva del símbolo de \n
my @cadena = split (//, $cadena);	# |  La cadena se convierte en un arreglo

&cuerpo;
&encabezado;

#  Ciclo para recorrer la cadena
for my $character (@cadena) {
	my $estadosig = $estado;
	
	#  Llamada a la función para saber si es un caracter válido
	my $charcaracter = &caracter ( $character );
	
	#  Se guarda el valor obtenido en la tabla según las coordenadas recibidas
	$estado = $tabla [$estado][$charcaracter];
	
	#  Si el valor obtenido es una E, imprimimos "Cadena no válida"
	if ($estado eq "E") {
		say ("|     ",$estadosig,"      |  ",$character,"    |",$simbolo," |     ",$estado,"       |");
		&cuerpo;
		say "|              Cadena no valida :(                   |";
		say ("+----------------------------------------------------+");
		exit ();
	}
	&contenido ($estadosig, $character, $simbolo, $estado);
}

#  Si al concluir el estado no es 3, que es el de aceptación, se imprime "Cadena no válida"    
if ( $estado != 3 ) {
        say "|              Cadena no valida :(                   |";
        say ("+----------------------------------------------------+");
}

#  Si el estado es 3, entonces es una cadena de aceptación
if ( $estado == 3 ) {
    say ("|     ",$estado,"      |         |Fin cadena |               |");
    &cuerpo;
    say ("|                Cadena valida                       |");
    say ("+----------------------------------------------------+");
}
