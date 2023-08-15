# DDoS-simulation : Methodologies to simulate DDoS testing scenarios

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
### NXDomain flood attack : Targetting a single nameserver with large volume of illegitimate and random subdomains
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


## Disclaimer: Use of the Code

The author of this code provides it for informational and educational purposes only. While the code may be useful for various applications, it is essential to understand that its usage comes with inherent risks. By accessing or implementing this code, you agree that:

1. **No Liability for Misuse**: The author is not responsible for any direct or indirect damages, losses, or harm caused by the use or misuse of the code. This includes but is not limited to personal injury, data loss, financial losses, or any negative consequences resulting from its application.

2. **Understanding of Code**: You acknowledge that you have a sufficient understanding of the code and its functions before utilizing it. If you are unsure about any aspect of the code, you are encouraged to seek assistance or further knowledge.

3. **Independent Evaluation**: You agree to independently evaluate and test the code in your specific environment and scenarios. The code may not be suitable for every situation, and it is your responsibility to ensure its compatibility and suitability.

4. **Compliance with Laws and Regulations**: It is your obligation to comply with all applicable laws, regulations, and policies when using the code. This includes respecting copyrights, data protection, and any other relevant legal requirements.

5. **No Support or Warranty**: The author does not provide any warranty or support for the code. The code is provided "as is" without any guarantees of functionality, reliability, or correctness.

6. **Acknowledgment of Risk**: You understand that using code, especially for critical applications, carries inherent risks. You assume all responsibility for any consequences that may arise from its use.

By proceeding with the code, you signify your acceptance of this disclaimer and release the author from any liability related to the use or misuse of the provided code. If you do not agree with these terms, refrain from accessing, implementing, or using the code.
