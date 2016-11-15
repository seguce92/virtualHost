#! /bin/bash

hosts_file='/etc/hosts';
server_name='';
ip='192.168.10.10';

function check()
{
    if [ "$hosts_file" = "" ]; then
        echo "You must config the hosts_file!";
        exit 1
    fi
    
    if ! [ -f $hosts_file ]; then
        echo "The $hosts_file does not exist, please check your config";
        exit 1
    fi

    echo '' >> $hosts_file;
    
    if [ $? = 1 ]; then
        echo "You don't have pemission to write $hosts_file, please use sudo";
        exit
    fi
}

function add_host()
{
   echo "Please enter your ServerName ('www.yoursite.com') :";
   read server_name;
   host="'$ip'  $server_name";
   #echo '' >> $hosts_file;
   echo $host >> $hosts_file;
}

check;
add_host;

echo -e "Successfully add virtual host, please :\n
1. go to $server_name check ($ open http://$server_name)\n"
exit 0
