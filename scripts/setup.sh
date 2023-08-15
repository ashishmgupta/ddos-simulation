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
sudo mkdir ../ddos_tests

if [ -e /usr/share/wordlists/rockyou.txt ]; then
    echo "/usr/share/wordlists/rockyou.txt was downloaded from the package wordlist"
else
    echo "/usr/share/wordlists/rockyou.txt does not exist."
fi
echo "Allow execute for the scripts"
sudo chmod +x *.sh 
echo "Started -- Preparing a file with DNS queries for random subdomains for a domain"
sudo ./create_random_domain_queries_file.sh -i /usr/share/wordlists/rockyou.txt -o random_domains_dns_queries.txt
echo "Completed -- Preparing a file with DNS queries for random domain names for a domain"
echo "Started -- Preparing a file with multiple DNS query for a single domain"
sudo ./create_single_domain_queries_file.sh
echo "Completed -- Preparing a file with multiple DNS query for a single domain"