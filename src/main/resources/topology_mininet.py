#!/usr/bin/python
 
"""
A simple minimal topology script for Mininet.
 
Based in part on examples in the [Introduction to Mininet] page on the Mininet's
project wiki.
 
[Introduction to Mininet]: https://github.com/mininet/mininet/wiki/Introduction-to-Mininet#apilevels
 
"""
 
from mininet.cli import CLI
from mininet.log import setLogLevel
from mininet.net import Mininet
from mininet.topo import Topo
from mininet.node import RemoteController, OVSSwitch
from mininet.util import dumpNodeConnections
import sys
class MinimalTopo( Topo ):
    "Minimal topology with a single switch and two hosts"
 
    def build( self ):
        # Create two hosts.
        h1 = self.addHost( 'h1' )
        h2 = self.addHost( 'h2' )
        h3 = self.addHost( 'h3' )
        h4 = self.addHost( 'h4' )
        # Create a switch
        s1 = self.addSwitch( 's1',protocols=["OpenFlow13"] )
        s2 = self.addSwitch( 's2',protocols=["OpenFlow13"] )
        s3 = self.addSwitch( 's3', protocols=["OpenFlow13"] )
        s4 = self.addSwitch( 's4', protocols=["OpenFlow13"] )
        
        # Add links between the switch and each host
        self.addLink( s1, h1 )
        self.addLink( s2, h2 )
        self.addLink( s3, h3 )
        self.addLink( s4, h4 )
        self.addLink( s1, s2 )
        self.addLink( s2, s3 )
        self.addLink( s3, s4 )
        self.addLink( s4, s1 )
     
def writeTofile(net): 
     file=open("hostsInfo.txt","w")
     file.write("connections"+'\n')
     for link in net.links:
       file.write(str(link)+'\n')
     file.write("IP"+'\n')
     for host in net.hosts:
        file.write(host.name+ ' '+host.IP()+'\n')
     file.close()

def worker(net):
       print "Dumping Node connections"
       dumpNodeConnections(net.hosts)
       time.sleep(3)
def runMinimalTopo():
    "Bootstrap a Mininet network using the Minimal Topology"
 
    # Create an instance of our topology
    topo = MinimalTopo()
 
    # Create a network based on the topology using OVS and controlled by
    # a remote controller.
    net = Mininet(
        topo=topo,
        controller=lambda name: RemoteController( name, ip='127.0.0.1',port=6633),
        switch=OVSSwitch,
        autoSetMacs=True )
    # Actually start the network
   
    writeTofile(net)
    net.start()
    
    """print "Dumping host connections"
    dumpNodeConnections(net.hosts)
    print "Dumping host IP"
    for host in net.hosts:
        print(host.name+ ' '+host.IP())
    # Drop the user in to a CLI so user can run commands."""
    CLI( net )
 
    # After the user exits the CLI, shutdown the network.
   # net.stop()
 
if __name__ == '__main__':
    # This runs if this file is executed directly
    setLogLevel( 'info' )
    runMinimalTopo()
 
# Allows the file to be imported using `mn --custom <filename> --topo minimal`
topos = {
    'minimal': MinimalTopo
}
