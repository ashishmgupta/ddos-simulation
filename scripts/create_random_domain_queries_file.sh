#!/bin/bash

# Default values
domain_name="marvel.local"
input_file=""
output_file="dns_queries.txt"

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

if [ -z "$input_file" ]; then
    echo "Usage: $0 -d <domain> -i <input_file> [-o <output_file>]"
    exit 1
fi

echo "Remove lines with special characters and empty spaces"
sudo grep -E '^[a-zA-Z0-9]+$' "$input_file" | sed -E 's/ //g' > "${output_file}_cleaned"

echo "Truncate each line to MAX 100 characters"
sudo cut -c 1-100 "${output_file}_cleaned" > "${output_file}_truncated"

echo "Append the suffix ---> .${domain_name} A <--- to each line"
while IFS= read -r line; do
    echo "${line}.${domain_name} A"
done < "${output_file}_truncated" > "$output_file"

echo "Clean up intermediate files"
sudo rm "${output_file}_cleaned" "${output_file}_truncated"

echo "Result saved in $output_file"
