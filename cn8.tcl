# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(stop)   10.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator -multicast on] ;

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
set group [Node allocaddr] ;
#===================================
#        Nodes Definition        
#===================================
#Create 5 nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

#===================================
#        Links Definition        
#===================================
#Createlinks between nodes
$ns duplex-link $n0 $n4 100.0Mb 10ms DropTail
$ns queue-limit $n0 $n4 50
$ns duplex-link $n0 $n2 100.0Mb 10ms DropTail
$ns queue-limit $n0 $n2 50
$ns duplex-link $n0 $n1 100.0Mb 10ms DropTail
$ns queue-limit $n0 $n1 50
$ns duplex-link $n0 $n3 100.0Mb 10ms DropTail
$ns queue-limit $n0 $n3 50

#Give node position (for NAM)
$ns duplex-link-op $n0 $n4 orient left-up
$ns duplex-link-op $n0 $n2 orient left-down
$ns duplex-link-op $n0 $n1 orient right
$ns duplex-link-op $n0 $n3 orient left

set mproto DM ;
set mrthandle [$ns mrtproto $mproto] ;
#===================================
   # Agents Definition 
    set udp [new Agent/UDP]
    $ns attach-agent $n0 $udp 
   
     $udp set dst_addr_ $group
     $udp set dst_port_ 0    
#===================================

#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
$udp set des_addr_ $group
$udp set dst_port_ 0

set recvr1 [new Agent/LossMonitor] ;
$ns attach-agent $n1 $recvr1
$ns at 1.9 "$n1 join-group $recvr1 $group" ;
set recvr2 [new Agent/LossMonitor] ;
$ns attach-agent $n2 $recvr2
$ns at 2.2 "$n2 join-group $recvr2 $group" ;
set recvr3 [new Agent/LossMonitor] ;
$ns attach-agent $n3 $recvr3
$ns at 2.4 "$n3 join-group $recvr3 $group" ;
set recvr4 [new Agent/LossMonitor] ;
$ns attach-agent $n4 $recvr4
$ns at 2.6 "$n4 join-group $recvr3 $group" ;
$ns at 1.9 "$n4 leave-group $recvr1 $group" ;

set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp
$cbr0 set packetSize_ 1000
$cbr0 set rate_ 1.0Mb
$cbr0 set random_ null
$ns at 1.0 "$cbr0 start"
$ns at 2.0 "$cbr0 stop"


#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run

