Un pulsador es un componente que completa o corta un circuito dependiendo de si está oprimido o no.

En este diagrama, el pulsador conecta el GPIO 14 a un Ground (cuando está oprimido).

Raspberry pico con pulsador

https://wokwi.com/projects/373598323049905153

La tarjeta Raspberry Pi Pico permite establecer un GPIO como una entrada de información:

pinMode(14, INPUT_PULLUP); // GPIO 14 es ahora de entrada

La función que permite leer el estado del GPIO de entrada (leer si está conectado al voltaje positivo o a Ground) es:

digitalRead();

Por ejemplo:

boolean boton = digitalRead(14);

Lee el estado del GPIO 14 y el resultado (0 ó 1) lo asigna a la variable 'boton'.

