#!/bin/bash

iptables -N TOR
iptables -A TOR -j DROP

curl -sk "https://check.torproject.org/torbulkexitlist" | xargs -I {} -n1 bash -c 'iptables -A INPUT -s "{}" -p tcp -m multiport --dports 80,443 -j TOR;echo "IP TOR : {} => Blocked"' _
