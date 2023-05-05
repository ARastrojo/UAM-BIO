# Acceso al cluster UAM-BIO

Desde el grupo _"Microbial and Environmental Genomics"_ ponemos a disposición de todo el departamento de Biología el uso de las 4 máquinas (64 cores / 512 Gb de RAM) que tenemos alojadas en el _Centro de Computación Científica_ (CCC) de la UAM. 

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

Para conectarnos al clúster hacemos uso de la conexión _SSH_ (_Secure Shell_). En MacOS y en Linux existe un cliente _ssh_ pre-instalado en el sistema. El Windows no, así que deberéis installar alguno, como [Putty](https://www.putty.org/), o instalar _WSL_ (_Windows Subsystem for Linux_) que nos permitirá ejecutar comando de Linux desde Windows (como la conexión _ssh_). 

La conexión la realizamos a través de 3 posibles máquinas de _login_ (login1, login2 y login3):

```bash
ssh usuario@login1.ccc.uam.es

# usuario -> el que os hayan asignado al aprobar vuestro proyecto en el CCC

# Para conectarse a otra máquina de login sólo hay que cambiar "login1" por "login2" o "login3"
```

Inicialmente os asignarán una contraseña aleatoria que os harán llegar por correo interno. Para cambiarla, tendréis que ir físicamente al CCC (Facultad de Ciencias en el módulo 16). Además, cada cierto tiempo (6 meses) el sistema os pedirá cambiar la contraseña (esta vez desde vuestro ordenador).

![login]()

