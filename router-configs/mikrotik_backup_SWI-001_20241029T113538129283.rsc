# 2024-10-28 12:17:19 by RouterOS 7.14
# software id = 
#
/port
set 0 name=serial0
/ip address
add address=192.168.1.20/24 interface=ether1 network=192.168.1.0
/ip dhcp-client
add interface=ether1
/ip firewall filter
add action=accept chain=input comment="Allow SSH" port=22 protocol=tcp
add action=accept chain=input dst-port=80 protocol=tcp
/ip firewall nat
add action=dst-nat chain=dstnat dst-port=80 protocol=tcp to-addresses=\
    192.168.1.10 to-ports=80
/system note
set show-at-login=no
