#!/usr/bin/perl

 # ***************************************************************************
 #  Nombre:		Julieta Rodríguez Espiricueta
 #  Carrera:		Ingeniería en Tecnologías de la Información (ITI)
 #  Profesor:		Juan Carlos González Ibarra
 #  Institución:		Universidad Politécnica de San Luis Potosí
 #  Matrícula:		180024
 #
 #  Descripción:	Programa que muestra las tablas de verdad de los
 #				operadores lógicos OR, AND, NOT y  ^.
 #
 #****************************************************************************

use strict;                     
use warnings;

use feature "say";        # |  Característica de Perl que imprime un salto de línea automático

#********************************************************************
#  Perl no tiene ningún tipo especial para los valores booleanos.
#  Sin embargo, en la documentación de Perl se menciona que
#  comúnmente el 0 es Falso y el 1 es Verdadero.
#*********************************************************************
my @booleanos = ( 0, 1 );	# |  Lista con los dos posibles valores booleanos, False y True, para iterar sobre ellos

my $x;	# |  Variables para representar 
my $y;	# |  los valores booleanos

#%#%
#  Función booleana
sub boolean {				# |
	my $variable = $_[0];	# |  Debido a que True y False se representa
						# |  con ceros y unos en Perl, se crea una
	if ($variable == 1) {		# |  función que imprime "True" si la variable
		print "True";		# |  vale 1, pero si esta variable vale 0, se 
	} else { print "False"}	# |  imprime "False".
}						# |  

#%#%
#  Tabla OR
say "x\ty\tx OR y";
say "-" x 22;

for $x ( @booleanos ) {
	for $y ( @booleanos ) {
		&boolean ($x);		# |  Valor de x
		print "\t";
		&boolean ($y);		# |  Valor de y
		print "\t";
		&boolean ($x or $y);	# |  Valor de (x or y)
		say "";
		#say ( $x . "\t" . $y . "\t" . ($x or $y) );	# |  Expresión con 0 y 1
	}
}

#%#%
#  Tabla AND
say "\nx\ty\tx AND y";
say "-" x 22;

for $x ( @booleanos ) {
	for $y ( @booleanos ) {
		&boolean ($x);		# |  Valor de x
		print "\t";
		&boolean ($y);		# |  Valor de y
		print "\t";
		&boolean ($x and $y);	# |  Valor de (x and y)
		say "";
		#say ( $x . "\t" . $y . "\t" . ($x and $y) );	# |  Expresión con 0 y 1
	}
}

#%#%
#  Tabla NOT
say "\nx\tNOT x";
say "-" x 13;

for $x ( @booleanos ) {
	&boolean ($x);		# |  Valor de x
	print "\t";
	&boolean (not $x);		# |  Valor de (not x)
	say "";
	#say $x . "\t" . (not $x);	# |  Expresión con 0 y 1
}

#%#%
#  Tabla ^
say "\nx\ty\tx ^ y";
say "-" x 22;

for $x ( @booleanos ) {
	for $y ( @booleanos ) {
		&boolean ($x);		# |  Valor de x
		print "\t";
		&boolean ($y);		# |  Valor de y
		print "\t";
		&boolean ($x ^ $y);	# |  Valor de (x ^ y)
		say "";
		#say ( $x . "\t" . $y . "\t" . ($x ^ $y) );	# |  Expresión con 0 y 1
	}
}
say "";
