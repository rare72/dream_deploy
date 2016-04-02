#!/bin/bash
#This code is nothing more than a scriptlet. This code belongs within a larger script.
grep "<.*>*</.*>" sample3|cut -d"<" -f2|cut -d">" -f2
exit
