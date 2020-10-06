# Programa en Perl de un AFD
## Datos personales
- **Nombre:**       Julieta Rodríguez Espiricueta  
- **Carrera:**      Ingeniería en Tecnologías de la Información (ITI)  
- **Profesor:**     Juan Carlos González Ibarra  
- **Institución:**	Universidad Politécnica de San Luis Potosí  
- **Matrícula:**    180024


## Descripción
Programa que recrea el funcionamiento de un Autómata Finito Determinista (AFD), en particular el reconocimiento de cadenas.  
Se valida una entrada similar a 1+2, reconociendo patrones en la cadena ingresada para determinar si esta es válida o no.  

La siguiente tabla ilustra las transiciones que debe de realizar este autómata:  

| Estado | Dígitos | Operadores | Fin de cadena |
| :---: | :---: | :---: |  :---: |
| q<sub>0</sub> | q<sub>1</sub> | Error |  Error |
| q<sub>1</sub> | Error | q<sub>2</sub> | Error |
| q<sub>2</sub> | q<sub>f</sub> | Error | Error |
| q<sub>f</sub> | Error | Error | Aceptación |


## Sintaxis
En Perl, es posible utilizar los comandos para expresiones regulares que el propio lenguaje ya tiene por defecto. Entre estas expresiones se encuentra `=~`:  
    
    "Hello World" =~ /World/;		# |  Se encuentra el patrón en la cadena  


#### Declaración de variables globales
Se tuvieron que inicializar las valiables globales como `undef`, es decir, no se le asigna un valor a una variable.  
    
    use vars qw ( $simbolo );
    use vars qw ( $fin );
    
    $simbolo = undef;
    $fin = undef;
De esta manera, las variables globales inician sin un valor asignado al iniciar el programa.

#### Comandos
    $character =~ /\d+$/						# |  Reconoce si hay un dígito en la cadena
    
    $character =~ /\+|\-/ or $character eq "*" or $character eq "/"	# |  Reconoce si hay un operador en la cadena

#### Función base para la generación de la tabla
```
my @tabla= ([1,"E","E"],["E",2,"E"],[3,"E","E"],["E","E","A"]);
my $estado = 0;

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
```


## Problemas y soluciones al programar  
Al momento de tratar de encontrar un patrón que reconociera los dígitos en la cadena, el programa no diferencía letras de números, por lo que si se ingresaba la cadena e+4 se tomaba como válida. Incluso se llegó a implementar el módulo *Regexp::Common* y el *Scalar::Util qw(looks_like_number)*, pero seguía sin distinguir letras de números.  
Debido a esto, se optó por utilizar `$character =~ /\d+$/`, donde `/\d/` en teoría reconoce los números.
