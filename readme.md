# Acceso al cluster UAM-BIO

Desde el grupo [_"Microbial and Environmental Genomics"_](https://www.me-genomics.com/) ponemos a disposición de todo el departamento de Biología el uso de las 2 máquinas (64 cores / 512 Gb de RAM) que tenemos alojadas en el _Centro de Computación Científica_ ([CCC](https://www.ccc.uam.es/index.html)) de la UAM. 

Los **<u>únicos requisitos</u>** para su uso son:
1.  Hacer un uso legal y razonable (en caso contrario se podrá interrumpir el acceso a las colas previo aviso de incurrir en abuso).  
2. Incluir en agrademientos de cualquier publicación (paper, poster, TFG, TFM, Tesis, etc.) que se ha hecho uso del clúster de cómputo del departamento de Biología (con el fin de monitorizar el uso). 

Para poder acceder al uso de estas máquinas (que hemos llamado cluster UAM-BIO) tendréis que:

1. **Daros de alta en el CCC [aquí](https://www.ccc.uam.es/es/accounts/sol_pro.html).**

> Esencialmente al daros de alta en el CCC deberéis presentar un pequeño proyecto que os dará acceso al cluster de cómputo del CCC (colas ccc y cccmd, aunque están bastante saturadas). En el formulario se os solicitará que os asignéis un nombre de usuario y se os permitirá añadir al proyectos tanto usuarios como necesitéis. 

2. Escribir a [alberto.rastrojo@uam.es](mailto:alberto.rastrojo@uam.es) o a [daniel.aguirre@uam.es](mailto:daniel.aguirre@uam.es) para que os demos acceso a las colas (bio y biobis)

3. **Daros de alta en la lista cluster-uambio [aquí](https://listas-correo.uam.es/sympa/subscribe/cluster-uambio-l?previous_action=info).**  Tanto el IP del proyecto como los todos los usuarios adicionales. 

Para cualquier duda podéis hacer uso de la lista de correo ([cluster-uambio-l@uam.es](mailto:cluster-uambio-l@uam.es)) o escribiendo al responsable técnico del cluster UAM-BIO ([alberto.rastrojo@uam.es](mailto:alberto.rastrojo@uam.es)).

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

![login](https://github.com/ARastrojo/UAM-BIO/blob/848429bca23a95ba0995b17d1c8a40bdf6995e29/images/login.png)

La primera vez que os logeis os preguntará si confiáis en el sitio. Debéis escribir "yes".  

> The authenticity of host 'login1.ccc.uam.es (150.244.55.101)' can't be established.
XXXXXXX key fingerprint is SHA256:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? **yes**

> **Conexión desde fuera del campus:** para poder conectarse al clúster desde fuera de la red de UAM debemos hacer uso de la [VPN](https://www.uam.es/uam/tecnologias-informacion/servicios-ti/acceso-remoto-red).

## Espacios en disco

En la solicitud de proyecto al CCC debéis indicar vuestras necesidades de espacio y cómputo. Por defecto, se os concederán X Gb de espacio en disco de almacenamiento en el directorio del _proyecto_ y unos 100 Mb en el directorio _home_ de cada usuario de manera gratuíta. Si necesitáis más espacio de almacenamiento se puede obtener pagando la cuota correspondiente (consultar precios [aquí](https://www.ccc.uam.es/es/about/precios.pdf)).

Directorios y usos:

- **_home_**: es la carpeta raíz de cada usuario. En ella podemos almacenar scripts y pequeños documentos ya que sólo disponemos de 100 Mb. Esta carpeta es accesible por el usuario desde todas las máquinas de cómputo. 
- **_proyecto_**: en esta carpeta se deben almacenar los datos de manera semi-permanente (siempre que os quede espacio). Esta carpeta está sometida diariamente a copias de seguridad por lo que los datos aquí almacenados están muy seguros. Esta carpeta es accesible por el usuario desde todas las máquinas de cómputo. 
- **_temporal_**: este espacio es propio de cada máquina de cómputo y sólo es accesible desde esa máquina. El espacio disponible depende de cada cola. En las colas _bio_ y _biobis_ disponemos de ~900 Gb de espacio. En este espacio podemos copiar los datos necesarios para ejecutar nuestros trabajos, pero debe quedar vacío al terminar. Es posible que no se disponga de todo el espacio de almacenamiento si no tenéis reservada la máquina completa y trabajo de otro usuario coincide en la misma máquina que el vuestro. 
- **_scratch_**: se trata de un directorio que podemos usar de manera esporádica para almacenar datos muy grandes que no nos quepan en nuestra carpeta proyecto. No está pensado para la conservación de nuestros datos, sino para situaciones excepcionales. 


**Tabla resumen espacios disco**
 
| Directorio   | Ruta (PATH)               | Tipo  | Uso |
|----------|---------------------------|-------|-----| 
| Home     | /home/usuario/            | RED   | Almacenamiento scripts |
| Proyecto | /home/proyectos/XXXXX/ | RED   | Instalación de programas y almacenamiento de datos |
| Scratch  | /scratch/usuario/         | RED   | Almacenamiento de datos temporales |
| Temporal | /temporal/usuario/        | LOCAL | Almacenamiento de datos temporales (se debe borrar tras la ejecución de cada trabajo) |

_usuario_: el nombre de cada usuario  
_XXXXX_: el nombre del proyecto que habéis solicitado  

Las carpetas que ponen “red” están conectadas por red a todas las máquinas, es decir, esos “discos” no están conectados a la máquina en la que se trabaja, sino en otras máquinas de almacenamiento que son accesibles mediante red a todo el clúster. En estas carpetas se pueden almacenar datos, pero no deben usarse estos datos para los cálculos ya que estaríamos provocando mucho tráfico en la red, lo que provoca que todo el cluster se ralentice, y muy probablemente los administradores del cluster maten tu trabajo. Por lo tanto, para hacer uso de los datos que tenemos almacenados en las carpetas en red (_proyectos_ o _scratch_) debemos copiarlos a la carpeta _temporal_. Muy excepcionalmente, si los datos no caben en _temporal_ podemos hacer uso de _scratch_. 

**Estructura del clúster**  

![estructura_cluster](https://github.com/ARastrojo/UAM-BIO/blob/57a6667e3d8e6800c7ed3b47210683acea1ec396/images/cluster.png)


## Instalación de programas

**Software disponible**

- **_/usr/local/bioinfo/_**: en esta ruta podemos encontrar bastantes programas ya instalados.

| | | |
|------------|--------------|------------|
| annotsv    | git          | rvtests    |
| annovar    | glpk         | salmon     |
| automap    | gnuplot      | samtools   |
| bcftools   | gradle       | sbml       |
| bcl2fastq2 | hisat2       | seekdeep   |
| bedtools   | IGV          | spades     |
| .. | .. | .. |

- **[Modules](https://www.tacc.utexas.edu/research/tacc-research/lmod/)**: los modulos son un sistema de entornos virtuales que permiten que los administradores del clúster puedan instalar diferentes programas con sus dependencias (que a veces entran en conflictos con otros programas). 

Para ver los módulos disponibles ejecutar **"_module avail_"**:
| abinit/8.0.8b | deMon2k/5.0_intel   | lammps/2022      | petsc/3.11.2       |
|---------------|---------------------|------------------|--------------------|
| abinit/8.10.3 | deMonNano/deMonNano | last/14.1.8      | petsc/3.15-intel20 |
| abinit/9.4.2  | desmond/2015.3      | last/9.4.2       | pexsi/1.2.0        |
| abinit/abinit | dftbp/18.1          | lobster/3.0.0    | pgap/5742          |
| abyss/2.0.2   | dftbp/19.1          | lumerical/2020R2 | phyluce/1.7.1      |
| ..            | ..                  | ..               | ..                 |

Para cargar módulos: **_module load NOMBRE_**  
Para descargarlos: **_module unload NOMBRE_**  
Para ver los módulos cargadas: **_module list_**  

**_Instalación de nuevos programas_**

La manera más sencilla de instalar otros programas que necesiteis (o versiones diferentes de las instaladas) es escribir a [administracion.ccc@uam.es](mailto:administracion.ccc@uam.es) con vuestra petición. No esperéis que sean rápidos. Generalmente tardan una semana es procesar vuestra solicitud. 

Otra forma sería que os los instaléis vosotros/as mismos/as si tenéis los conocimientos necesarios. Los programas se deben instalar en la carpeta _home_ o en _proyectos_. No siempre es posible la instalación por que requieren permisos de administrador que no tenemos como usuarios. 

**_Bases de datos_**: además de los programas ya instalados también disponemos de algunas bases de datos ya descargadas en **_/usr/local/BBDD/_**, aunque no se actualizan de manera automática, hay que solicitarlo escribiendo a [administracion.ccc@uam.es](mailto:administracion.ccc@uam.es). 

## Ejecución de trabajos

Para ejecutar los trabajos debemos crear pequeños scripts con todas las instrucciones necesarias. Lo más frecuente es utilizar _bash_, aunque podemos usar otros lenguajes de programación (_tsch_, _python_, _perl_, etc.).  

Aquí tenéis un ejemplo sencillo:
```bash
#!/bin/bash 

resultdir=home/proyectos/microbioma/rastrojo/
workdir=/temporal/rastrojo/output

#--Check if workdir exits, if so delete it, and then create it 
if [ -d $workdir ]
	then
	rm -fr $workdir
fi
mkdir -p $workdir
cd $workdir # entering workdir

#--Copy required data to temporal folder
cp /home/proyectos/microbioma/rastrojo/data/file_R1.fastq $workdir
cp /home/proyectos/microbioma/rastrojo/data/file_R2.fastq $workdir

#--Running 
module load spades/3.15.4
spades.py --careful -t 24 -1 file_R1.fastq -2 file_R2.fastq -o assembly_output
module unload spades/3.15.4

#--Copy results 
cp -r assembly_output $resultdir

#--Remove working directory to release disk space 
rm -rf $workdir
```

***
**IMPORTANTE**

Tradicionalmente para copiar los datos a la carpeta /temporal/ creábamos previamente una carpeta, en el ejemplo de arriba "output", cuyo nombre elegía el usuario. Esto se puede seguir haciendo, siempre que luego se borre al terminar el trabajo. Sin embargo, podría darse el caso de que varios trabajos user la misma carpeta temporal y se podrían generar conflictos en la ejecución de vuestros trabajos. Por ello, desde el CCC nos informaron de lo siguiente:

_Estimadas y estimados usuarios,_  

_Cada vez que envían un trabajo al sistema de colas se crea de forma automática un directorio llamado:_

_/temporal/$SLURM_JOB_USER/$SLURM_JOB_ID_  

_donde recuerden que /temporal es un directorio local existente en la gran mayoría de las máquinas de cálculo._  

_Al terminar el cálculo se borra de forma automática._  

_Por favor, utilicen este directorio para almacenar los datos temporales de las ejecuciones que utilicen un único nodo, dado que así sus cálculos se ejecutarán de forma más rápida y además se evitará que este tipo de almacenamiento se llene y provoque fallos en ejecuciones posteriores._  

Por lo tanto, se recomienda hacer uso de la carpeta que se crea de manera automática en lugar de una personal, que además se borrará automáticamente al terminar. 

***

Ahora guardamos el script en un fichero (_script.sh_) y lo lanzamos al sistema de colas de la siguiente manera:

```bash
sbatch -A microbioma_serv -p bio -N 1 -n 24 -o log.txt -s script.sh
```

- **-A**: proyecto
- **-p**: nombre de la cola (se puede poner varios a la vez: _bio,biobis,ccc_)
- **-N**: número de nodos (máquinas) simultáneas que quieres usar. La mayoría de los programas que usamos en análisis de secuencias no puede usar varias máquinas simultáneas (algunos sí).
- **-n**: número de _threads_ (hilos). Es más o menos el número de procesadores que queremos usar, pero como la mayoría de los procesadores modernos puede ejecutar 2 o más cosas simultáneamente (_hyperthreading_), eso nos permite utilizar cada procesador como si en realidad tuviéramos 2. Nuestras máquinas tiene 32 procesadores, pero cada procesador puede ejecutar 2 procesos simultáneos, así que en realidad podemos usar hasta 64 _threads_. 
- **-o**: nombre de que queremos que tenga el _log_ del proceso. Es muy importante cuando las cosas salen mal, aquí podremos averiguar lo que ha pasado. Ponerle un nombre personalizada es opcional, por defecto, por cada trabajo que lancemos a las colas se generará un fichero tipo _slurm_XXXXX.log_ (XXXX es el mismo número que se asigna a cada trabajo en el sistema de colas). 
- **-s**: script que queremos lanzar a las colas. 

Una vez lanzado el trabajo, para comprobar el estado podemos ejecutar el siguiente comando:

```bash
squeue -u usuario
```

| JOBID   | PARTITION | NAME     | USER     | ST | TIME        | NODES | NODELIST(REASON) |
|---------|-----------|----------|----------|----|-------------|-------|------------------|
| 5084564 | biobis    | script.s | rastrojo | R  | 12:04:00 AM | 1     | cubas            |

- **JOBID**: el identificar asignado al trabajo
- **PARTITION**: la cola en la que está lanzado el trabajo
- **NAME**: nombre del scritp
- **USER**: nombre del usuario
- **ST**: estado del trabajo. R: _running_ o PD: _pending_. En PD el sistema de colas está analizado la priodad del trabajo y esperando a que haya los recursos disponibles que hemos solicitado. 
- **NODES**: número de nodos (máquinas) usadas
- **NODELIST(REASON)**: si el trabajo está corriendo pondrá el nodo/s en los que está corriendo el trabajo. Si aún no está corriendo pondrá la razón, generalmente _(Priority)_ o _(Resources)_ (no hay recursos disponibles)

Para **cancelar** un trabajo que está corriendo usamos el siguiente comando:
```bash
scancel 5084564 
# 5084564 -> número asignado a nuestro trabajo
```

Para ver el estado de las máquinas de un/as cola/s podemos usar:

```bash
sinfo -p bio,biobis
```

| PARTITION | AVAIL | TIMELIMIT | NODES | STATE | NODELIST    |
|-----------|-------|-----------|-------|-------|-------------|
| bio       | up    | infinite  | 1     | down* | coslada     |
| bio       | up    | infinite  | 1     | alloc | colmenarejo |
| biobis    | up    | infinite  | 2     | idle  | cotos,cubas |

En **STATE** podemos ver _idle_ (inactivas), _alloc_ (asignadas, en uso), _drained_ (agotada) o _down*_ (caída). Cuando alguna máquina esté caída es conveniente que nos lo digáis para que avisemos al personal del CCC para que las reinicien. 

<!--
Puede ver las especificaciones principales de una cola en concreto con el siguiente comando:
```bash
sinfo -Nel -p bio,biobis
```

| NODELIST    | NODES | PARTITION | STATE     | CPUS | S:C:T | MEMORY | TMP_DISK | WEIGHT | AVAIL_FE | REASON        |
|-------------|-------|-----------|-----------|------|-------|--------|----------|--------|----------|---------------|
| colmenarejo | 1     | bio       | allocated | 64   | 4:8:2 | 515800 | 0        | 1      | (null)   | none          |
| coslada     | 1     | bio       | down*     | 64   | 4:8:2 | 515800 | 0        | 1      | (null)   | Not reponding |
| cotos       | 1     | biobis    | idle      | 64   | 4:8:2 | 515800 | 0        | 1      | (null)   | none          |
| cubas       | 1     | biobis    | idle      | 64   | 4:8:2 | 451292 | 0        | 1      | (null)   | none          |

-->

> En la carpeta _scripts_ de este repositorio iremos colgando más ejemplos de scripts que esperamos sean útililes. 
