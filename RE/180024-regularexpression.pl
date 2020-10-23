#!/usr/bin/perl

 # ***************************************************************************
 #  Nombre:		Julieta Rodríguez Espiricueta
 #  Carrera:		Ingeniería en Tecnologías de la Información (ITI)
 #  Profesor:		Juan Carlos González Ibarra
 #  Institución:	Universidad Politécnica de San Luis Potosí
 #  Matrícula:		180024
 #
 #  Descripción:	Programa generador de gramática regular.
 #                      Analizador léxico simple.
 #
 #****************************************************************************

use strict;                     
use warnings;
use feature "say";

my @tokens = ();                                     # |  Lista vacía
my $cadena = 'int result = 100;';               # |  Se declara una cadena
my @source_code = split ( ' ', $cadena );	# |  Se convierte la cadena en una lista de palabras
my $word;

#  Se recorre cada palabra de source_code
foreach $word (@source_code) {
   #  Se comprueba si un token tiene una declaración de tipo de dato
   if ( $word =~ /str|int|bool/ ) {
      push ( @tokens, ("['DATATYPE', '$word']") );
   }
   
   #  Se busca un identificador que sería solo una palabra
   elsif ( $word =~ /[a-zA-Z]/ ) {
      push ( @tokens, ("['IDENTIFIER', '$word']") );
   }
   
   #  Se busca un operador
   elsif ( $word =~ /[\+\-\/\*\=\%]/ ) {
      push ( @tokens, ("['OPERATOR', '$word']") );
   }
   
   #  Se buscan elementos enteros y los convierte a número
   elsif ( $word =~ /[0-9]/ ) {
      my @word2 = $word;
      if ( $word2 [length(@word2) - 1] =~ /;/ ) {
         my $integer = substr ($word, 0, -1);
         push ( @tokens, ("['INTEGER', '$integer']") );
         push ( @tokens, ("['END_STATEMENT', ';']") );
      }
      else {
         push ( @tokens, ("['INTEGER', '$word']") );
      }
   }
}
say "[@tokens]" ;

sub variablePROLOG {
   my ( @w ) = @_;		#  Paso del parámetro
   
   #  El primer caracter es una mayúscula o un subrayado
   if ( ($w[0] =~ /[A-Z]/ and $w[0] == uc($w[0])) or $w[0] eq "_" ) {
      @w = shift(@w);      #  Se quita el primer caracter
      
      #  Mientras queden caracteres en "w" y el primer caracter actual sea un alfanumérico o un subrayado, todo está bien
      while ( @w and ($w[0] =~ /[a-zA-Z0-9_]/ or $w[0] eq "_") ) {
         @w = shift(@w);      #  Se quita el primer caracter
      }
      #Si ya no quedan elementos a revisar, es una variable PROLOG
      if ( @w == '' ) {
         return 1;
      }
   }
   return 0;
}
