# Aplicacion en Android Studio

Después de hecho el web service, procedemos a la creación de la aplicación móvil. 

Para poder consumir nuestra web service desde android, primero descargamos una librería para window llamada ksoap2, esta librería nos permite consumir toda web service que sea de tipo xml y ese es nuestro caso ya que trabajamos con el programa Visual Studio el cual nos genera un web service de tipo xml. Después también usamos el programa keyoti.conveyor el cual nos proporciona una ip y un puerto diferente al “localhost” con el que podremos consumir nuestro web service. Sin este programa es imposible consumirlo ya que el localhost genera problemas al consumirlo desde un dispositivo android. 

![image](https://user-images.githubusercontent.com/37960514/61086266-0570b480-a3f8-11e9-959f-fd1050116230.png)   ![image](https://user-images.githubusercontent.com/37960514/61086312-233e1980-a3f8-11e9-917e-5b09044ec9ba.png)

Ya teniendo esto para poder consumir nuestra web service, pasamos el ip generado por el conveyor a nuestra aplicación en android con el mismo puerto. Es importante recordar que la ip que le pasamos es la que empieza con http, porque ese también es el protocolo de nuestro espacio de trabajo.

![image](https://user-images.githubusercontent.com/37960514/61086416-67311e80-a3f8-11e9-8743-badf341bf182.png)

![image](https://user-images.githubusercontent.com/37960514/61086440-76b06780-a3f8-11e9-9bed-f00dee4c2ef8.png)

Una vez ya teniendo el ip y el puerto podemos consumir nuestra web service desde Android Studio, y solo queda consumir las funciones de nuestro web service que invocan a los procedimientos almacenados de nuestra base de datos.
