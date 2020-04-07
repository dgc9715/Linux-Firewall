#!/bin/bash

echo "0 Save iptables to file"
echo "1 Restore iptables from file"
echo "2 Enable Firewall"
echo "3 Disable Firewall"
echo -n "Enter the desired option > "
read text
if [ $text = "0" ]; then
	echo -n "Enter the file where you want to save iptables > "
	read dir
	sudo iptables-save > $dir
elif [ $text = "1" ]; then
	echo -n "Enter the file from you want to restore iptables > "
	read dir
	sudo iptables-restore $dir
elif [ $text = "2" ]; then
	sudo delgroup internet-for-all
	sudo addgroup internet-for-all
	sudo iptables -D OUTPUT -m owner \! --gid-owner internet-for-all -j REJECT
	sudo iptables -A OUTPUT -m owner \! --gid-owner internet-for-all -j REJECT
	echo "Use 'sudo -g internet-for-all YOURCOMMAND' to start an application with internet access"
elif [ $text = "3" ]; then
	sudo iptables -D OUTPUT -m owner \! --gid-owner internet-for-all -j REJECT
else
	echo "Good choice"
fi
