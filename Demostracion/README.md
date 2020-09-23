# Programa en Perl con tablas de verdad

## Datos personales
- **Nombre:**       Julieta Rodríguez Espiricueta  
- **Carrera:**      Ingeniería en Tecnologías de la Información (ITI)  
- **Profesor:**     Juan Carlos González Ibarra  
- **Institución:**	Universidad Politécnica de San Luis Potosí  
- **Matrícula:**    180024


## Descripción
Programa que construye las tablas de verdad correspondientes a los operadores lógicos básicos OR, AND y NOT,  incluyendo también el O EXCLUSIVO, que es verdadero cuando uno 
y solo uno de los operandos lo es, pero se deriva a partir de los tres básicos. Su representación es ^, el sombrero o caret.   


## Sintaxis
A continuación se describe cómo fueron programadas las tablas de verdad en Perl ya que, debido a que este lenguaje tiene la limitante de no contar con una expresión booleana 
como tal, se tuvieron que emplear unos y ceros, tomando el 1 como "True" y el 0 como "False". 

#### Declaración de valores booleanos
    my @booleanos = ( 0, 1 );  
    my $x;
    my $y;
La lista guarda los valores True y False respectivamente, mientras que las variables $x y $y sirven para representar estos valores en los ciclos.

#### Comandos
    $x or $y;     # |  Tabla OR
    
    $x and $y;    # |  Tabla AND
    
    not $x;       # |  Tabla NOT
    
    $x ^ $y;      # |  Tabla O EXCLUSIVO (^)  
***Es importante no confundir los operadores lógicos OR y AND con los operadores de unión e intersección de conjuntos (| y &).***

#### Función base para las tablas
```
for $x ( @booleanos ) {
	for $y ( @booleanos ) {
		&boolean ($x);                                # |  Valor para x
		print "\t";
		&boolean ($y);                                # |  Valor para y
		print "\t";
		&boolean ($x or $y);                          # |  Valor del operando correspondiente
		say "";
		#say ( $x . "\t" . $y . "\t" . ($x or $y) );  # |  Versión simplificada para imprimir solamente 1 y 0
	}
}
```

## Problemas y soluciones al programar  
Debido a que Perl no despliega como tal el resultado "True" o "False" en una operación booleana, se anadió una función en la que si el resultado es 1, se imprime que 
la declaración es verdadera; si no, se imprime que es falsa.
```
sub boolean {
	my $variable = $_[0];   # |  La variable @_ permite acceder a los parámetros de la función

	if ($variable == 1) {
		print "True"
	} else { print "False"}
}	
```
Esta función se implementa en todas las tablas, siendo su único propósito el mostrar las palabras "True" o "False" según corresponda en cada caso.
