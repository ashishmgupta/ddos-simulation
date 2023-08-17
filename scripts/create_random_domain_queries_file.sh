#!/bin/bash

# Default values
domain_name=""
input_file="/usr/share/wordlists/rockyou.txt"
output_file="random_domains_dns_queries.txt"

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -d|--domain)
            domain_name="$2"
            shift # Shift past the key
            shift # Shift past the value
            ;;
        -i|--input)
            input_file="$2"
            shift
            shift
            ;;
        -o|--output)
            output_file="$2"
            shift
            shift
            ;;
        *) # Unknown option
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

if [ -z "$domain_name" ]; then
    read -p "Enter the domain name: " domain_name
fi

if [ -z "$domain_name" ]; then
    echo "Domain name is required."
    exit 1
fi

echo "Remove lines with special characters and empty spaces"
grep -E '^[a-zA-Z0-9]+$' "$input_file" | sed -E 's/ //g' > "${output_file}_cleaned"

echo "Truncate each line to max 100 characters"
cut -c 1-100 "${output_file}_cleaned" > "${output_file}_truncated"

echo "Remove duplicates"
sort -u "${output_file}_truncated" > "${output_file}_uniq"

echo "Append the prefix dddostest- and suffix ===> ${domain_name} A <=== on each line"
while IFS= read -r line; do
    echo "ddostest-${line}.${domain_name} A"
done < "${output_file}_uniq" > "$output_file"

echo "Clean up intermediate files"
rm "${output_file}_cleaned" "${output_file}_truncated" "${output_file}_uniq"

echo "Transformation complete. Result saved in $output_file"
