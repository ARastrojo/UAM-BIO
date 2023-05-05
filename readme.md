# Acceso al cluster UAM-BIO

Desde el grupo [_"Microbial and Environmental Genomics"_](https://www.me-genomics.com/) ponemos a disposición de todo el departamento de Biología el uso de las 4 máquinas (64 cores / 512 Gb de RAM) que tenemos alojadas en el _Centro de Computación Científica_ (CCC) de la UAM. 

Los **<u>únicos requisitos</u>** para su uso son:
1.  Hacer un uso legal y razonable.  
2. Incluir en agrademientos de cualquier publicación (paper, poster, TFG, TFM, Tesis, etc.) que se ha hecho uso del clúster de cómputo del departamento de Biología (con el fin de monitorizar el uso). 

Para poder acceder al uso de estas máquinas (que hemos llamado cluster UAM-BIO) tendréis que:

1. **Daros de alta en el CCC [aquí](https://www.ccc.uam.es/es/accounts/sol_pro.html).**

> Esencialmente al daros de alta en el CCC deberéis presentar un pequeño proyecto que os dará acceso al cluster de cómputo del CCC (colas ccc y cccmd, aunque están bastante saturadas). En el formulario se os solicitará que os asignéis un nombre de usuario y se os permitirá añadir al proyectos tanto usuarios como necesitéis. 

> Para acceder a las máquinas del cluster UAM-BIO debéis indicar en el campo 4 del formulario _"uso de las máquinas de Daniel Aguirre"_.  De este modo, además de las colas propias del CCC, tendréis acceso a nuestras colas (bio y biobis).

2. **Daros de alta en la lista cluster-uambio-l@uam.es [aquí](https://listas-correo.uam.es/sympa/subscribe/cluster-uambio-l?previous_action=info). <!--**NO FUNCIONA LA LISTA** Crearla de nuevo-->**

Para cualquier duda podéis hacer uso de la lista de correo ([cluster-uambio-l@uam.es](cluster-uambio-l@uam.es)) o escribiendo al responsable técnico del cluster UAM-BIO ([alberto.rastrojo@uam.es](mailto:alberto.rastrojo@uam.es)).

***
# Funcionamiento del cluster (CCC y UAM-BIO)

Dado que las máquinas del clúster UAM-BIO están alojadas junto con el clúster del CCC el funcionamiento básico es similar, salvo al lanzar un trabajo, en cuyo caso indicaremos la cola específica en la que queremos que se ejecute nuestro trabajo (ccc/cccmd o bio/biobis). 

## Conexión con el clúster

Para conectarnos al clúster hacemos uso de la conexión _SSH_ (_Secure Shell_). En MacOS y en Linux existe un cliente _ssh_ pre-instalado en el sistema. El Windows no, así que debemos installar alguno, como [Putty](https://www.putty.org/) o [mobaXterm](https://mobaxterm.mobatek.net/download.html), o instalar _WSL_ (_Windows Subsystem for Linux_) que nos permitirá ejecutar comandos de Linux desde Windows (como la conexión _ssh_). 

La conexión la realizamos a través de 3 posibles máquinas de _login_ (login1, login2 y login3):

```bash
ssh usuario@login1.ccc.uam.es

# usuario -> el que os hayan asignado al aprobar vuestro proyecto en el CCC

# Para conectarse a otra máquina de login sólo hay que cambiar "login1" por "login2" o "login3"
```

Inicialmente os asignarán una contraseña aleatoria que os harán llegar por correo interno. Para cambiarla, tendréis que ir físicamente al CCC (Facultad de Ciencias en el módulo 16). Además, cada cierto tiempo (6 meses) el sistema os pedirá cambiar la contraseña (esta vez desde vuestro ordenador).

![login](https://github.com/ARastrojo/UAM-BIO/blob/5ea4ae22b52d75909d4ef789d1d2f905897de678/images/login.png)

La primera vez que os logéis os preguntará si confiáis en el sitio. Debéis escribir "yes".  

> The authenticity of host 'login1.ccc.uam.es (150.244.55.101)' can't be established.
ED25519 key fingerprint is SHA256:ZAIGxfphum8y2Df9t2fR5AohHqCVKWn5XyZmlhb4zKc.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? **yes**

> **Conexión desde fuera del campus:** para poder conectarse al clúster desde fuera de la red de UAM debemos hacer uso de la [VPN](https://www.uam.es/uam/tecnologias-informacion/servicios-ti/acceso-remoto-red).

## Espacios en disco

En la solicitud de proyecto al CCC debéis indicar vuestras necesidades de espacio y cómputo. Por defecto, se os concederán 500 Gb de espacio en disco de almacenamiento en el directorio del _proyecto_ y unos 100 Mb en el directorio _home_ de cada usuario de manera gratuíta. Si necesitáis más espacio de almacenamiento se puede obtener pagando la cuota correspondiente (consultar precios [aquí](https://www.ccc.uam.es/es/about/precios.pdf)).

Directorios y usos:

- _home_: es la carpeta raíz de cada usuario. En ella podemos almacenar scripts y pequeños documentos ya que sólo disponemos de 100 Mb. Esta carpeta es accesible por el usuario desde todas las máquinas de cómputo. 
- _proyecto_: en esta carpeta se deben almacenar los datos de manera semi-permanente (siempre que os quede espacio). Esta carpeta está sometida diariamente a copias de seguridad por lo que los datos aquí almacenados están muy seguros. Esta carpeta es accesible por el usuario desde todas las máquinas de cómputo. 
- _temporal_: este espacio es propio de cada máquina de cómputo y sólo es accesible desde esa máquina. El espacio disponible depende de cada cola. En las colas _bio_ y _biobis_ disponemos de ~900 Gb de espacio. En este espacio podemos copiar los datos necesarios para ejecutar nuestros trabajos, pero debe quedar vacío al terminar. Es posible que no se disponga de todo el espacio de almacenamiento si no tenéis reservada la máquina completa y trabajo de otro usuario coincide en la misma máquina que el vuestro. 
- _scratch_: se trata de un directorio que podemos usar de manera esporádica para almacenar datos muy grandes que no nos quepan en nuestra carpeta proyecto. No está pensado para la conservación de nuestros datos, sino para situaciones excepcionales. 


**Tabla resumen espacios disco**
 
| Directorio   | Ruta (PATH)               | Tipo  | Uso |
|----------|---------------------------|-------|-----| 
| Home     | /home/usuario/            | RED   | Almacenamiento scripts |
| Proyecto | /home/proyectos/XXXXX/ | RED   | Instalación de programas y almacenamiento de datos |
| Scratch  | /scratch/usuario/         | RED   | Almacenamiento de datos temporales |
| Temporal | /temporal/usuario/        | LOCAL | Almacenamiento de datos temporales (se debe borrar tras la ejecución de cada trabajo) |

usuario: el nombre de cada usuario
XXXXX: el nombre del proyecto que habéis solicitado

Las carpetas que ponen “red” están conectadas por red a todas las máquinas, es decir, esos “discos” no están conectados a la máquina en la que se trabaja, sino en otras máquinas de almacenamiento que son accesibles mediante red a todo el clúster. En estas carpetas se pueden almacenar datos, pero no deben usarse estos datos para los cálculos ya que estaríamos provocando mucho tráfico en la red, lo que provoca que todo el cluster se ralentice, y muy probablemente los administradores del cluster maten tu trabajo. Por lo tanto, para hacer uso de los datos que tenemos almacenados en las carpetas en red (_proyectos_ o _scratch_) debemos copiarlos a la carpeta _temporal_. Muy excepcionalmente, si los datos no caben en _temporal_ podemos hacer uso de _scratch_ 

![estructura_cluster](https://github.com/ARastrojo/UAM-BIO/blob/57a6667e3d8e6800c7ed3b47210683acea1ec396/images/cluster.png)
