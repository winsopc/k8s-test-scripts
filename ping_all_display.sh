#!/bin/bash
i=0
ip_addrs=$(cat test_ips)
n=$(cat test_ips| wc -l)
file=non_reachable_ip.txt
rm -f $file
touch $file
echo total ip $n
for ip in $ip_addrs;
do
	ping -c 2 $ip > /dev/null
	if [[ $? != 0 ]]; then
		echo $ip >> $file
	fi
	PCT=$(( 100*(++i)/$n ))
	echo $PCT | dialog --gauge "Please wait" 10 30 0
done
