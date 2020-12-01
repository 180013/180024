#!/usr/bin/perl

 # ***************************************************************************
 #  Nombre:		Julieta Rodríguez Espiricueta
 #  Carrera:		Ingeniería en Tecnologías de la Información (ITI)
 #  Profesor:		Juan Carlos González Ibarra
 #  Institución:	Universidad Politécnica de San Luis Potosí
 #  Matrícula:		180024
 #
 #  Descripción:	Programa que recrea el comportamiento de una
 #			Máquina de Turing que efectúa una multiplicación unaria
 #
  #  En colaboración con Diana Rodríguez Espiricueta (170010) 
 #****************************************************************************

use strict;                     
use warnings;
use feature "say";        		# |  Característica de Perl que imprime un salto de línea automático

sub turingM {
	my ( $estado, $blanco, @cinta, $final, @reglas, $posicion ) = @_;
	
	my $break = 1;
	my $numCinta = 1;
	my $i = 0;
	
	if ( !@cinta ) {
		push( @cinta, "" ); 
	}
	
	if ( $posicion < 0 ) {
        	$posicion = $posicion  + scalar @cinta;
        }
        
        if ( ($posicion >= scalar @cinta) or ($posicion < 0) ) {
        	say "Se inicializa mal la posicion";
        }
        
        while( !$break ) {
        	say $estado;
        	for my $i  (0..(scalar @cinta)-1) {
        		if ( $i eq $posicion ) {
        			print "[ $cinta[$i] ]";
        		}
        		else {
        			print "$cinta[$i]";
        		}
        	}
        	say "";
        }
        
        if ( $estado eq $final ) {
        	$break = 1;
        }
        
        my @character;
        for my $character (@reglas) {
        	if ( ($estado == $character[0]) and ($cinta[$posicion] == $character[$i]) ) {
        		$numCinta = 0;
        	}
        }
        if ( $numCinta ) {
        	$break = 1;
        }
        if ( !$break ) {
        	my $v1 = "";
        	my $dr = "";
        	my $s1 = "";
        	
        	for my $character (@reglas) {
        		if ( ($estado == $character[0]) and ($cinta[$posicion] == $character[1]) ) {
        			$v1 = $character[2];
				$dr = $character[3];
				$s1 = $character[4];
        		}
        	}
        	
        	my @nuevaCinta;
        	
        	for my $x  (0..(scalar @cinta)-1) {
        		if ( $x == $posicion ) {
        			@nuevaCinta = $nuevaCinta[$v1];
        		}
        		else {
        			@nuevaCinta = $nuevaCinta[$cinta[$x]];
        		}
        	}
        	@cinta = @nuevaCinta;
        	
        	if ( $dr eq "left" ) {
        		if ( $posicion > 0 ) {
        			$posicion = $posicion - 1;
        		}
        		else {
        			push( @cinta, "" ); 
        		}
        	}
        	
        	if ( $dr eq "right" ) {
        		$posicion = $posicion + 1;
        		if ( $posicion >= scalar @cinta ) {
        			push( @cinta, "" ); 
        		}
        	}
        	$estado = $s1;
        }
}

#  .: MAIN :.  #
say ("MAQUINA DE TURING TEST MULTIPLICACION \n");

my @reglas =  [["s0", "1", "1", "right", "s0"],                              #Transiciones del estado 0
              ["s0", "x", "x", "right", "s0"],
              ["s0", "b", "x", "left",  "s1"],

              ["s1", "1", "1", "left",  "s1"],                              # Transiciones del estado 1
              ["s1", "x", "x", "left",  "s1"],
              ["s1", "b", "b", "right", "s2"],

              ["s2", "1", "b", "right", "s3"],                              # Transiciones del estado 2
              ["s2", "x", "b", "right", "s8"],

              ["s3", "1", "1", "right", "s3"],                              # Transiciones del estado 3
              ["s3", "x", "x", "right", "s4"],

              ["s4", "1", "b", "right", "s5"],                              # Transiciones del estado 4
              ["s4", "x", "x", "left",  "s7"],

              ["s5", "1", "1", "right", "s5"],                              # Transiciones del estado 5
              ["s5", "x", "x", "right", "s5"],
              ["s5", "b", "1", "left",  "s6"],

              ["s6", "1", "1", "left",  "s6"],                              #Transiciones del estado 6
              ["s6", "x", "x", "left",  "s6"],
              ["s6", "b", "b", "right", "s4"],

              ["s7", "b", "1", "left", "s7"],                               # Transiciones del estado 7
              ["s7", "x", "x", "left", "s1"],

              ["s8", "1", "b", "right", "s8"],                              # Transiciones del estado 9
              ["s8", "x", "b", "right", "s9"]];

	my @cinta = ["1","1","1","x","1","1"];
	&turingM ( "s0", "b", @cinta, "s9", @reglas, 0 );