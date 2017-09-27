#!/usr/bin/env bash

# remove default gw because it's setup incorrectly when we create the vagrant box
# vagrant needs an eth0 for its configuration, even though we don't want it.
eval $(route -n | awk '{ if ($8 =="eth0" && $2 != "0.0.0.0") print "route del default gw " $2; }')

# SLC ViaWest router is the default gateway to allow other network's LANs (outside subnets) to see this box.
route add default gw 10.10.20.1

echo $? 'Reconfigured the network'