#!/bin/bash

output_file="single_domain_dns_queries.txt"
lines=14000000
domain_name=""

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -d|--domain)
            domain_name="$2"
            shift
            shift
            ;;
        *) # Unknown option
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Prompt user for domain if not provided
if [ -z "$domain_name" ]; then
    read -p "Enter the domain name: " domain_name
fi

# Exit if domain name is not provided
if [ -z "$domain_name" ]; then
    echo "Domain name is required."
    exit 1
fi

echo "Generating $lines lines in $output_file with domain $domain_name..."

for ((i = 1; i <= lines; i++)); do
    echo "$domain_name A" >> "$output_file"
done


echo "File generation complete."
