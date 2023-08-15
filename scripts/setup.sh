#!/bin/bash
echo "Applying updates...."
sudo apt-get -y update
echo "Installing dnsperf"
sudo apt-get -y install dnsperf
echo "Installing hping3"
sudo apt-get -y install hping3
echo "Installing wordlists"
sudo apt-get -y wordlists
echo "crearing a directory named ddos_tests"
sudo mkdir ddos_tests
echo "switching to ddos_tests directory"
sudo cd ddos_tests
echo "extracting the rockyou.txt from /usr/share/wordlists/rockyou.txt.gz to the current directory"
gzip -d  /usr/share/wordlists/rockyou.txt.gz .
echo "downloading the scripts from github"
wget https://raw.githubusercontent.com/ashishmgupta/ddos-simulation/main/scripts/create_random_domain_queries.sh
wget https://raw.githubusercontent.com/ashishmgupta/ddos-simulation/main/scripts/dnsperf_test.sh
echo "Allow execute for the script"
sudo chmod +x create_random_domain_queries.sh 
sudo chmod +x dnsperf_test.sh
echo "preparing a file with DNS queries for random domain names"
sudo ./create_random_domain_queries.sh /usr/share/wordlists/rockyou.txt 
