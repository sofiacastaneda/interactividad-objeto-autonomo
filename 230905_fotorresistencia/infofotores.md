Algunos sensores se basan en el cambio de resistencia de algunos objetos bajo diferentes condiciones: cambios de luz, presión, temperatura, etc. Estos se llaman sensores resistivos.

Un circuito divisor de voltaje permite convertir una resistencia que varía en un voltaje que varía. Esto es útil porque la tarjeta Arduino no puede leer resistencia directamente, pero sí puede leer voltaje.

Artículo de Khan Academy sobre divisores de voltaje:
https://es.khanacademy.org/science/electrical-engineering/ee-circuit-analysis-topic/ee-resistor-circuits/a/ee-voltage-divider

Una fotorresistencia es un componente electrónico que varía su resistencia según la intensidad de la luz que incida sobre ella.

Al combinarla con un resistor de valor fijo, como en el diagrama de abajo, se puede lograr que un voltaje varíe a medida de varía la resistencia. Esta combinación se llama un circuito divisor de voltaje. 

Este ejemplo no está implementado en Wokwi porque en esa plataforma no está disponible la fotorresistencia sencilla.

Una punta de la fotorresistencia se conecta a 3.3V (PIN 36) y la otra punta a la entrada análoga 0 (GPIO 26)
Una punta del resistor de 10000 Ohmios (10K Ω) se conecta a un GND y la otra punta se conecta también a la entrada análoga 0 (GPIO 26)

El código puede ser cualquiera de los usados para la lectura del potenciómetro, porque es el mismo procedimiento: lectura de un voltaje análogo y su digitalización como un valor entre 0 y 1024. Intenten combinar la fotorresistencia con el parlante piezoeléctrico, por ejemplo.

Para más detalles sobre los divisores de voltaje:

https://bloqueneon.uniandes.edu.co/d2l/le/lessons/207349/topics/1561198