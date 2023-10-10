import RPi.GPIO as GPIO
import time

# Setup the GPIO mode
GPIO.setmode(GPIO.BCM)

# Define the pin numbers
rows = [2, 3, 4, 17]
cols = [27, 22, 10, 9]

# Create a button matrix
buttons = [
    ['1', '2', '3', 'A'],
    ['4', '5', '6', 'B'],
    ['7', '8', '9', 'C'],
    ['*', '0', '#', 'D']
]

# Setup rows and columns
for row in rows:
    GPIO.setup(row, GPIO.OUT)
    GPIO.output(row, 1)
    
for col in cols:
    GPIO.setup(col, GPIO.IN, pull_up_down=GPIO.PUD_UP)

try:
    while True:
        # Check each row one by one
        for ridx, row in enumerate(rows):
            GPIO.output(row, 0)
            
            # Check each column
            for cidx, col in enumerate(cols):
                if not GPIO.input(col):
                    print("Button Pressed:", buttons[ridx][cidx])
                    while not GPIO.input(col):
                        pass  # Wait for button release

            GPIO.output(row, 1)
            
        time.sleep(0.1)

except KeyboardInterrupt:
    GPIO.cleanup()
