#!/bin/bash
#before run the test,  update the current ngnix pods ip file.
#kubectl get pods -l app=nginx -o wide |grep Running | awk '{print $6}' >ngnix_ips
i=0
ip_addrs=$(cat ngnix_ips)
n=$(cat ngnix_ips| wc -l)
file=ngnix_non_reachable_ip.txt
rm -f $file
touch $file
echo total ip $n
sleep 2s
for ip in $ip_addrs;
do
	#curl -ss http://$ip:80 > /dev/null
	curl -ss -o /dev/null http://$ip:80 2>&1
	if [[ $? != 0 ]]; then
		echo $ip >> $file
	fi
	PCT=$(( 100*(++i)/$n ))
	echo $PCT | dialog --gauge "Please wait" 10 30 0
done
