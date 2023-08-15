# ddos-simulation : Methodologies to simulate DDoS testing scenario

## Setup 
```
# this should create a file "random_subdomains_dns_queries.txt" with DNS queries for random/illegitimate subdomains under the chosen domain (marvel.local)
# and should also create one file named "single_domain_dns_queries.txt" with multiple entries of a single and valid domain.
git clone https://github.com/ashishmgupta/ddos-simulation.git
cd ~/ddos-simulation/scripts
./setup.sh  
```
## Running the test
### Targetting a single nameserver with large volume of single and legit DNS query
```
cd ~/ddos-simulation/scripts
chmod +x dnsperf_test.sh 
./dnsperf_test.sh -d single_domain_dns_queries.txt  -s 192.168.44.137 -Q 10000 -l 300
```
## NXDomain flood attack : Targetting a single nameserver with large volume of illegitimate and random subdomains
```
cd ~/ddos-simulation/scripts
chmod +x dnsperf_test.sh 
./dnsperf_test.sh -d single_domain_dns_queries.txt  -s 192.168.44.137 -Q 10000 -l 300
```

## Infrastructure
![image](https://github.com/ashishmgupta/ddos-simulation/assets/1037523/09d9d21e-1106-471b-b54c-7ef78429199c)

## Targetting a single nameserver with large volume of single and legit DNS query
![image](https://github.com/ashishmgupta/ddos-simulation/assets/1037523/67f3698e-cdab-4f0a-b8c1-11986b928912)

## NXDomain flood attack : Targetting a single nameserver with large volume of illegitimate and random subdomains
![image](https://github.com/ashishmgupta/ddos-simulation/assets/1037523/ee1a8022-00cc-4655-b83e-b2b2d1a87656)
