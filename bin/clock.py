#!/usr/bin/env python
from datetime import datetime
now = datetime.now()
aux=""

def define(hour: int) -> int:
    global aux
    if(hour <= 12):
        aux = "AM"
        if hour == 12:
            aux = "PM"
            return hour
        return hour
        
    else:
        aux =  "PM"
        return hour-12

print(f"{define(now.hour)}:{now.minute}:{aux} ")
