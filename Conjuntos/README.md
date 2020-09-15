# Programa en Perl con operaciones de conjuntos

## Datos personales
- **Nombre:**       Julieta Rodríguez Espiricueta  
- **Carrera:**      Ingeniería en Tecnologías de la Información (ITI)  
- **Profesor:**     Juan Carlos González Ibarra  
- **Institución:**	Universidad Politécnica de San Luis Potosí  
- **Matrícula:**    180024


## Descripción
Programa para realizar diferentes operaciones de conjuntos, para las cuales se hizo uso del módulo Set::Scalar, el cual permite realizar operaciones básicas de conjuntos 
en este lenguaje. Para esto, la descarga de este módulo se realizó desde la página web oficial CPAN (Comprehensive Perl Archive Network), https://metacpan.org/pod/Set::Scalar.    


## Comandos para ejecutar las operaciones
Enseguida se enlistan las sintaxis de las operaciones utilizadas para este programa. Cabe aclarar que no son las únicas funciones que se pueden realizar tratandose de conjuntos,
pero estas fueron implementadas en el presente código. Si se desea profundizar más en la implementación de estas funciones, consultar https://metacpan.org/pod/Set::Scalar.  

#### Creación de un conjunto
```
  $s = Set::Scalar->new;
  $s = Set::Scalar->new(@members);
```
  
#### Modificación de un conjunto
```
  $s->insert(@members); # Inserta un elemento
  $s->delete(@members);	# Elimina un elemento específico
  $s->invert(@members);	# Inserta si no lo ha hecho, elimina si los tiene
  $s->clear;  		# Elimina todos los elementos
```

#### Mostrar o imprimir un conjunto
	print $s, "\n";
El formato de visualización de un conjunto son los miembros del conjunto separados por espacios y encerrados entre paréntesis ().  

#### Consulta de un conjunto
	$s->has($m)        # Retorna "True" si contiene el elemento
	$s->contains($m)   # Alias para has().
	
	$s->member($m)     # Retorna el elemento si es que lo con
	$s->element($m)    # Alias para member().
  
#### Manejo de operacionales de un conjunto
```
$u = $s->union($t);			# Unión
$i = $s->intersection($t);		# Intersección
$d = $s->difference($t);		# Diferencia
$e = $s->symmetric_difference($t);	# Diferencia simétrica
```

## Solución de problemas
Debido a que un conjunto no es un tipo de dato existente en Perl, fue necesario añadir del módulo Set::Scalar, el cual permite realizar operaciones básicas de conjuntos en 
este lenguaje. Para esto, la descarga de este módulo se realizó desde el enlace puesto es la sección "Descripción", mencionada anteriormente.

De acuerdo a la página, la instalación del módulo se realiza copiando y pegando cualquiera de los siguientes comandos desde la consola de nuestra computadora.  

Con cpanm:  
```
cpanm Set::Scalar
```
Con CPAN shell:
```
perl -MCPAN -e shell
install Set::Scalar
```
Si este método no funciona, simplemente se debe de copiar la carpeta Set (ubicada en la carpeta lib) del archivo descargado, y pegarla en la dirección `C:\Perl64\lib`.
Se debe de tomar en cuenta que esta opción personalmente me funcionó con la versión Perl Strawberry.
