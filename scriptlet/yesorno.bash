#!/bin/bash
#This is a scriplet. This code belongs within an shell script
read -p "Is this a good question (y/n)? " answer

case ${answer:0:1} in

    y|Y )

        echo Yes
        date +"%H:%M:%S:%N" >>/tmp/output_test2
    ;;

    * )

        echo No
    ;;
esac
