La Raspberry Pico puede activar GPIOs con voltajes intermedios entre 0 y 3.3. Esto puede servir para controlar, por ejemplo, el brillo de LEDs y, más adelante, la velocidad de un motor, entre muchas otras cosas.

Recuerde que la función para prender / apagar un GPIO es digitalWrite();

Para activar voltajes intermedios, se usa la función analogWrite();

El primer parámetro indica qué GIPIO se va a activar y el segundo, con qué intensidad. El valor de intensidad debe ser un número entre 0 (mínimo) y 255 (máximo):

analogWrite(14,0); // totalmente apagado (0 voltios)

analogWrite(14,128); // voltaje intermedio (1.6 voltios aprox.)

analogWrite(14,255);  // totalmente prendido (3.3 voltios)


Este ejemplo demuestra cómo aumentar el brillo de un LED:

https://wokwi.com/projects/373614911398798337

Este otro ejemplo, además, usa un condicional IF para que el brillo vuelva a cero cuando llega al valor máximo.

https://wokwi.com/projects/373600326920628225