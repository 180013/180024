# Programa en Perl de un analizador léxico simple
## Datos personales
- **Nombre:**       Julieta Rodríguez Espiricueta  
- **Carrera:**      Ingeniería en Tecnologías de la Información (ITI)  
- **Profesor:**     Juan Carlos González Ibarra  
- **Institución:**	Universidad Politécnica de San Luis Potosí  
- **Matrícula:**    180024


## Descripción
Programa que recrea el funcionamiento de un analizador léxico simple, el cual creará los tokens para una declaración de variable entera.  
Un analizador léxico (lexer) tiene como propósito escanear el código fuente y dividir cada palabra en un elemento de la lista.
Una vez hecho esto, toma estas palabras y crea un par de tipo y valor, como el que se muestra a continuación:
```
['INTEGER', '100']
```
De esta manera se crea un token; estos identifican la sintaxis de su idioma, por lo que el objetivo del lexer es crear la sintaxis de su idioma, debido a que todo depende de cómo desee identificar e interpretar los diferentes elementos.


## Sintaxis
En Perl es posible utilizar los comandos para expresiones regulares que el propio lenguaje ya tiene por defecto. Entre estas expresiones se encuentra `=~`:  
    
    "Hello World" =~ /World/;   # |  Se encuentra el patrón en la cadena  


#### Comandos validadores
    $word =~ /str|int|bool/     # |  Reconoce si la cadena contiene "str", "int" o "bool"
    
    $word =~ /[a-zA-Z]/         # |  Reconoce si la cadena está formada solo por letras
    
    $word =~ /[\+\-\/\*\=\%]/   # |  Reconoce si existe un operador en la cadena

    $word =~ /[0-9]/            # |  Reconoce si la cadena contiene solo números

    $word =~ /[a-zA-Z0-9_]/     # |  Reconoce si la cadena se conforma de caracteres alfanuméricos

    $word =~ /[A-Z]/            # |  Reconoce si la cadena está en mayúsculas


## Problemas y soluciones al programar  
Debido a que, en este caso, en la declaración de una variable entera los elementos están separados por espacios, se optó por declarar la cadena aparte, para después convertirla a una lista de palabras con el método `split()`.
```
my $cadena = 'int result = 100;';           # |  Se declara una cadena
my @source_code = split ( ' ', $cadena );   # |  Se convierte la cadena en una lista de palabras
```

Por otra parte, para recuperar el entero sin el punto y coma (;) se utilizó la función `substr()`, la cual devuelve una subcadena de la cadena pasada a la función a partir de un índice dado hasta la longitud especificada.
```
my $integer = substr ($word, 0, -1);
```
