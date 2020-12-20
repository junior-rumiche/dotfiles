#!/usr/bin/env python
import psutil


def get_cpu()-> int:
    sum = 0
    data = list(psutil.cpu_percent(1, True))
    for i in data:
        sum += i
    return sum/len(data)

print("%.1f%s"%(get_cpu(), "%  "))
