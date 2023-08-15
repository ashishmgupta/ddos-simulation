echo "Updating...."
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
echo "extracting the rockyou.txt from /usr/share/wordlists/rockyou.txt.gz to teh current directory"
gzip -d  /usr/share/wordlists/rockyou.txt.gz .
echo "downloading the scripts from github"
