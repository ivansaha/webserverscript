#!/bin/bash

# Description: This script will help to automatically download, install, start, enable and check status of a desired package using linux centos/redhat flavors
# Date 5/8/2022
# Author sahaivan89@gmail.com
# Feel free to reach out to share suggestion ti improve this script

echo "Let us start by checking if the package is not already installed"
echo "$USER, what is the name of your package?"
read pck
systemctl status $pck > /dev/null

if [ $? -ne 0 ]
then
echo "$pck was not installed"
yum install $pck -y
echo "Now with the package installed, we just need to start and enable it"

echo "$pck is being started ........"
echo "$pck is being enabled ........"
systemctl start $pck
systemctl enable $pck
sleep 1
echo " "

echo "Let's check $pck new status"
systemctl status $pck
sleep 1
echo " "
echo " "

echo "Thanks for using this script"

exit 1

else
echo "Great the package was already installed"
echo "Since the package was installed, we just need to start and enable it"

echo "$pck is being started ........"
echo "$pck is being enabled ........"
systemctl start $pck
systemctl enable $pck
sleep 1
echo " "

echo "Let's check $pck new status"
systemctl status $pck
sleep 1
echo " "
echo " "

echo "Now let's start a firewall"
systemctl start firewalld
sleep 1

echo "Which port do you want your webserver to be read on?"
read port
sleep 1

echo "Which protocol do you want to link with your port?"
echo "Choose either udp or tcp; I recommend tcp for better reliability"
read protocol
sleep 1

echo "Let's open the port with its protocol"
firewall-cmd --permanent --add-port=$port/$protocol
sleep 1

echo "Let's reload the port"
sleep 1

echo "Which port do you want your webserver to be read on?"
read port
sleep 1

echo "Which protocol do you want to link with your port?"
echo "Choose either udp or tcp; I recommend tcp for better reliability"
read protocol
sleep 1

echo "Let's open the port with its protocol"
firewall-cmd --permanent --add-port=$port/$protocol
sleep 1

echo "Let's reload the port"
firewall-cmd --reload
sleep 1

echo "You're now ready to open your webserver by following this instruction:"
sleep 1

echo "cd /var/www/html/"
sleep 1

echo "Copy and paste your content in the index.html file, then find the browser with ipaddress:port"
echo "vi index.html"

fi