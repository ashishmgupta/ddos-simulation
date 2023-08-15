#!/bin/bash
echo "Applying updates...."
sudo apt-get -y update
echo "Installing dnsperf"
sudo apt-get -y install dnsperf
echo "Installing hping3"
sudo apt-get -y install hping3
echo "Installing wordlists"
sudo apt-get -y install wordlists
echo "Installing wordlists"
sudo apt-get -y install gzip
echo "crearing a directory named ddos_tests"
sudo mkdir ddos_tests
echo "switching to ddos_tests directory"
cd ~/ddos_tests
if [ -e /usr/share/wordlists/rockyou.txt ]; then
    echo "/usr/share/wordlists/rockyou.txt was downloaded from the package wordlist"
else
    echo "/usr/share/wordlists/rockyou.txt does not exist."
fi
echo "downloading the scripts from github"
sudo wget https://raw.githubusercontent.com/ashishmgupta/ddos-simulation/main/scripts/create_random_domain_queries_file.sh
sudo wget https://raw.githubusercontent.com/ashishmgupta/ddos-simulation/main/scripts/dnsperf_test.sh
echo "Allow execute for the scripts"
sudo chmod +x ~/ddos_tests/create_random_domain_queries_file.sh 
sudo chmod +x ~/ddos_tests/dnsperf_test.sh
echo "Start -- Preparing a file with DNS queries for random subdomains for lpl.com"
sudo ~/ddos_tests/create_random_domain_queries_file.sh -d lpl.com -i /usr/share/wordlists/rockyou.txt -o ~/ddos-tests/random_domains_dns_queries.txt
echo "End -- Preparing a file with DNS queries for random domain names for lpl.com"