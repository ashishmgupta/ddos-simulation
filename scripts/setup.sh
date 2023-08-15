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
sudo gzip -d rockyou.txt.gz
echo "Allow execute for the scripts"
sudo chmod +x *.sh 
echo "Started -- Preparing a file with DNS queries for random subdomains for a domain"
sudo ./create_random_domain_queries_file.sh -i rockyou.txt -o random_domains_dns_queries.txt
echo "Completed -- Preparing a file with DNS queries for random domain names for a domain"
echo "Started -- Preparing a file with multiple DNS query for a single domain"
sudo ./create_single_domain_queries_file.sh
echo "Completed -- Preparing a file with multiple DNS query for a single domain"