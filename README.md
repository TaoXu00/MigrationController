# configuration file
it contains all the customized settings in the Migration Controller.
# hostInfo.txt file
It is the description of the network topology deployed in the GENI. It can be replaced with the topology you deployed in GENI.
It will be used by the sdnStatisticController to aware the network topology with the information, such as links(connection), host IP address and bandwith.
If we use GENI, this file will be manully created according to the network topology we deployed.
Please don't change the format of the file.
The format is as following:  
1. Connections(this is the infomation of the links)  
if the link is between switches, then "swtichName1-portName1<->switchName2-portName2"  
if the link is between switch and host, then "swtichName1-portName1:macAddress<->hostName-portName"  
2. IP (this is the IP of all the hosts)  
hostName hostIP 
3.link bandwidth(this is the information of the bandwidth set when deploy the GENI)  
switchName<->hostName:bandwith Or switchName<->switchName:bandwidth (the unit of bandwidth is Mbps)
