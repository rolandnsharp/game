#!/usr/bin/awk -f

# This is a simple awk script for parsing web server access logs.
# It's not perfect, but it gets the job done.

# Usage:
# awk -f log_parser.awk /path/to/access.log

{
    # Field 1: IP Address
    # Field 4: Timestamp
    # Field 6: Request
    # Field 7: Status Code
    # Field 8: Bytes Sent
    # Field 9: Referer
    # Field 10: User Agent

    # Print a summary of each request
    printf "IP: %s, Request: %s, Status: %s
", $1, $6, $7
}
