#!/bin/bash
set -euo pipefail

awk '
BEGIN{
    ORS=" "
}
{
    if ($1=="iteration")
        print $3;
    else if ($1=="total" && $2=="energy")
        print $4;
    else if ($1=="estimated")
        print $5,"\n"
}' $1

