#!/usr/bin/env python
import speedtest
import datetime
import csv
import time

s = speedtest.Speedtest()
while True:
    with open('wifispeed.csv', mode='a+') as speedcsv:
        csv_writer = csv.DictWriter(speedcsv, fieldnames=['time', 'downspeed', 'upspeed'])
        if speedcsv.tell() == 0:
            csv_writer.writeheader()
        time_now = datetime.datetime.now().strftime("%H:%M:%S")
        downspeed = round((round(s.download()) / 1048576), 2)
        upspeed = round((round(s.upload()) / 1048576), 2)
        csv_writer.writerow({
            'time': time_now,
            'downspeed': downspeed,
            "upspeed": upspeed
        })
        time.sleep(2)
