from firebase import firebase
import time
import threading
from time import sleep
import RPi.GPIO as GPIO
FBConn = firebase.FirebaseApplication('https://medcare-c3184.firebaseio.com/', None)

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

GPIO.SETUP(21, GPIO.IN, pull_up_down=GPIO.PUD_UP)

buzzer=23
GPIO.setup(buzzer, GPIO.OUT)

previous = "null"

while True:
	state = GPIO.input(21)
	print(state)

	if state == 0 and previous == "open" or state == 0 and previous == "null":
		pill = str("bad") 


		data_to_upload = {
		'pillTaken' : pill
		}

		result = FBConn.patch('/Update', data_to_upload)
		previous = "closed"

		GPIO.output(buzzer, GPIO.LOW)
		print ("Alarm Beep")
		sleep(10)

		GPIO.output(buzzer, GPIO.HIGH)
		print ("No Alarm Beep")
		sleep(0.5)

		GPIO.output(buzzer, GPIO.LOW)
		print ("Alarm Beep")
		sleep(5)

		GPIO.output(buzzer, GPIO.HIGH)
		print ("No Alarm Beep")
		sleep(0.5)

		GPIO.output(buzzer, GPIO.LOW)
		print ("Alarm Beep")
		sleep(5)

		GPIO.output(buzzer, GPIO.HIGH)
		print ("No Alarm Beep")
		sleep(0.5)

		print('Circuit Closed.')


	if state == 1 and previous == "closed" or state == 1 and previous == "null":
		pill = str("good") 


		data_to_upload = {
		'pillTaken' : pill
		}

		result = FBConn.patch('/Update', data_to_upload)
		previous = "open"
	sleep(1)

GPIO.cleanup(21)


