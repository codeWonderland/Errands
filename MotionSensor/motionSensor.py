import requests
import datetime
import uuid
import time
from gpiozero import MotionSensor

pir = MotionSensor(27)
while True:
    if pir.motion_detected:
        r = requests.post("http://codewonderland.me:6789/api/addTask", data={'message':'You still have errands to complete!', 'author':'Errands_Bot', 'timeCreated': str(datetime.datetime.now()), 'uid': str(uuid.uuid4())})
        time.sleep(2)