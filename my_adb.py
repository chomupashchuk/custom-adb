import subprocess
import os
import time
import sys

subprocess.Popen(["adb", "-a", "-P", "5037", "server", "nodaemon"])

time.sleep(15)

ip_addresses = os.environ.get('TV_IPS', '')

if ip_addresses == '':
    sys.exit("No IPs detected")
else:
    ip_addresses = ip_addresses.split(" ")

if type(ip_addresses) != list:
    raise Exception("IP addresses must be a list")

for ip_addr in ip_addresses:
    if len(ip_addr.split(".")) != 4:
        raise Exception("'{}' does not seem like an IP".format(ip_addr))

while ip_addresses:
    for ip_addr in ip_addresses:
        try:
            subprocess.run(["adb", "connect", ip_addr])
        except Exception as ex:
            os.system("echo {}".format(ex))
            continue
    time.sleep(10)
