La tarjeta Raspberry Pico tiene tres entradas que permiten convertir (digitalizar) un voltaje análogo (de 0 a 3.3 voltios) en un número de 0 a 1024.

Raspberry Pico Potenciómetro

https://wokwi.com/projects/374796640111894529

Este ejemplo permite controlar el brillo del led de la tarjeta según la posición de potenciómetro.

Recuerden que el rango de valores posibles de brillo usando la función analogWrite() son sólo de 0 a 255 (8 bits), pero los valores leídos del potenciómetro usando la función analogRead() son de 0 a 1024 (10 bits). 
Para convertir un valor de un rango en un valor de otro rango se usa la función map().
Parece complicada porque tiene cinco parámetros, pero una vez se entiende su objetivo, resulta bastante útil.

Función map() en la referencia (diccionario) de Arduino.

https://www.arduino.cc/reference/en/language/functions/math/map/

Este otro ejemplo controla la frecuencia de parpadeo del LED de la tarjeta. El circuito es el mismo.
Noten que los rangos propuestos en la función map() son diferentes.

https://wokwi.com/projects/374796806696022017