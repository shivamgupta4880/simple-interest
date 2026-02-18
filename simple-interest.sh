#!/bin/bash

# Simple Interest Calculator Script
# This script calculates simple interest based on principal, rate, and time period

# Function to calculate simple interest
calculate_simple_interest() {
    local principal=$1
    local rate=$2
    local time=$3
    
    # Simple Interest Formula: SI = (P * R * T) / 100
    local interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
    local total=$(echo "scale=2; $principal + $interest" | bc)
    
    echo "Principal: $principal"
    echo "Rate of Interest: $rate% per annum"
    echo "Time Period: $time years"
    echo "Simple Interest: $interest"
    echo "Total Amount: $total"
}

# Input validation
if [ $# -ne 3 ]; then
    echo "Usage: $0 <principal> <rate> <time>"
    echo "Example: $0 1000 5 2"
    exit 1
fi

# Validate that inputs are numbers
if ! [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Principal must be a valid number"
    exit 1
fi

if ! [[ $2 =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Rate must be a valid number"
    exit 1
fi

if ! [[ $3 =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Time must be a valid number"
    exit 1
fi

# Call the function
calculate_simple_interest $1 $2 $3
