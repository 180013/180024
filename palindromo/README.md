# Programa en Perl para comprobar palíndromos
## Datos personales
- **Nombre:**       Julieta Rodríguez Espiricueta  
- **Carrera:**      Ingeniería en Tecnologías de la Información (ITI)  
- **Profesor:**     Juan Carlos González Ibarra  
- **Institución:**	Universidad Politécnica de San Luis Potosí  
- **Matrícula:**    180024


## Descripción
Programa que funciona para comprobar si una cadena ingresada por teclada corresponde a un palíndromo o no.  
Un palíndromo es una palabra que se escribe igual al derecho y al revés. Por ejemplo, rotor es un palíndromo, pero motor no.

Este programa utiliza la recursividad para comprobar si la palabra o frase ingresada es un palíndromo. Una manera de representar esto en forma de pseudocódigo sería la siguiente:
- Si la cadena está conformada por cero letras o una sola letra, entonces es un palíndromo.
- De lo contrario, compara la primera y la última letra de la cadena, no sin antes convertir todas las letras a mayúsculas y quitar los espacios en blanco en caso de ser una frase.
-  Si la primera y la última letra difieren, entonces la cadena no es un palíndromo.
- De lo contrario, la primera y la última letra son la misma. Se eliminan de la cadena y se determina si la cadena que queda es un palíndromo. Se toma la respuesta para esta cadena más pequeña y se usa como la respuesta para la cadena original.


## Sintaxis
En los palíndromos solo importa su lectura tanto de derecha a izquierda como viceversa, por lo que los espacios en blanco son irrelevantes. Por esta razón y para poder comparar los caracteres, se optó por quitar los espacios en blanco de la cadena ingresada con la siguiente expresión regular:
  
    $cadena =~ s/\s//g;         # |  Se remueven los espacios en blanco  

De igual manera, se convierten todas las letras a mayúsculas, para que no exista diferencia al momento de comparar. Esto se logra de la siguiente manera:
  
    $cadena = uc( $cadena );    # |  La cadena se pasa a mayúsculas

### Función esPalíndromo
Para comprobar si una cadena puede leerse de igual manera de derecha a izquierda y viceversa, se tiene la función que se muestra a continuación:
```
sub esPalindromo {
    my ( $cadena ) = @_;	# Paso del parámetro
    
    #  Si la cadena es tiene 1 o menos caracteres, es palíndromo
    if ( length($cadena) <= 1 ) {
        return 1;
    }
    
    #  Si el primer y último caracter de la cadena son diferentes, entonces la cadena no es un palíndromo
    if ( &primerCaracter($cadena) ne &ultimoCaracter($cadena) ) {
        return 0;
    }
    
    #  Caso recursivo que compara la cadena restante de quitar el primer y último caracter
    return &esPalindromo( &mitadCaracteres( $cadena ) );
}
```


## Problemas y soluciones al programar  
Debido a que se necesitaban eliminar el primer y último caracter de la cadena, se pensó en utilizar la función `splice()`, pero esto requería convertir la cadena a un arreglo, lo que dificultaba su uso en las demás funciones. Por esto mismo, se optó por usar la función `substr()`, la cual la cual devuelve una subcadena de la cadena pasada a la función a partir de un índice dado hasta la longitud especificada.
```
my $str = substr( $cadena, 0, 1 );
```
