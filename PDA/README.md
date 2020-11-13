# Programa en Perl de un PDA
## Datos personales
- **Nombre:**       Julieta Rodríguez Espiricueta  
- **Carrera:**      Ingeniería en Tecnologías de la Información (ITI)  
- **Profesor:**     Juan Carlos González Ibarra  
- **Institución:**	Universidad Politécnica de San Luis Potosí  
- **Matrícula:**    180024


## Descripción
Programa que recrea el funcionamiento de un Autómata de Pila (AP) o Push-Down Automata (PDA).
Se valida la expresión regular anbn, es decir, solamente se aceptan cadenas con igual número de letras "a" y "b", y ya no pueden aceptarse más "a's" después de detectar una "b".

Un autómata con pila, autómata a pila o autómata de pila es un modelo matemático de un sistema que recibe una cadena constituida por símbolos de un alfabeto y determina si esa cadena pertenece al lenguaje que el autómata reconoce. 


## Sintaxis
En Perl, es posible utilizar los comandos para expresiones regulares que el propio lenguaje ya tiene por defecto. Entre estas expresiones se encuentra `=~`:  
    
    "Hello World" =~ /World/;		# |  Se encuentra el patrón en la cadena  


#### Comandos para validar caracteres
    $character =~ m[a]	# |  Reconoce si hay un caracter "a"
    
    $character =~ m[b]	# |  Reconoce si hay un caracter "b"
    
    $character eq $fin	# |  Reconoce si hay un espacio vacío


#### Inicialización de la pila
    use vars qw ( @pila );	# |  Define la pila a utilizar
    @pila = "";		# |  Se inicializa la pila


#### Implementación de la pila
    push( @pila," x " );
    pop @pila;
La función `pop` extrae el último elemento de un arreglo y lo elimina.
La función `push`  agrega un elemento o una lista de elementos al final de un arreglo.


## Problemas y soluciones al programar  
Al ser una pila que solo acepta la expresión anbn, no es posible ingresar una letra "a" después de que se detecta una letra "b". Por lo mismo, se implementó la siguiente condición para validar que ya no se ingresen más letras "a" después de "b".
```
#  Si se ingresa una "a" después de haber sido detectada una "b", entonces la cadena es inválida
	if ( $charcaracter == 0 and $bandera == 1 ) {
		say ("|       ",$estado,"      |         | Fin cadena|               |");
		&cuerpo;
		say "|              Cadena no valida :(                   |";
		say ("+----------------------------------------------------+");
		exit ();
	}
```
