#!/bin/bash

function cpu_main(){
cpu_vendor
cpu_core
total_memory
free_ram
disk_size
echo -e "\n------------------------------------------"
}

function cpu_vendor(){
	echo -e  "CPU Vendor\t: $(cat /proc/cpuinfo | grep "vendor_id" | awk '{print $3}' | sort -u)"
}

function cpu_core(){
	echo -e "CPU Cores\t: $(cat /proc/cpuinfo | grep "cpu cores" | awk '{print $4}' | sort -u)"
}

function total_memory(){
	echo -e "Total Memory\t: $(free -mh | grep "Mem:" | cut -d" " -f12)"
}

function free_ram(){
	echo -e "Free RAM\t: $(free -mh | grep "Mem:"| cut -d" " -f28)"
}

function disk_size(){
	echo -e "Total Disk Size\t: $(lsblk | grep "sda" | head -1 | awk '{print $4}')"
}

function manual_enum(){
while true ;
do
 
	echo -e "\n+++++++++++++++++++++++++++++++++++++++"
	echo -e "\nSub Menu :"
	echo -e "\n+++++++++++++++++++++++++++++++++++++++"

	echo -e " \n 1)CPU Manufacturer \n 2)No. of cores \n 3)Ram Memory \n 4)Free RAM \n 5)Total Disk size\n 6)Return to main menu" 
	read -p "Input : " input 
	case "$input" in 
		"1")
			echo -e "\n------------------------------------\n"
			cpu_vendor 
			echo -e "\n------------------------------------\n"
			;;

		"2")
			echo -e "\n------------------------------------\n"
			cpu_core	
			echo -e "\n------------------------------------\n"				
			;;

		"3")
			echo -e "\n------------------------------------\n"
			total_memory
			echo -e "\n------------------------------------\n"
			;;
		"4")
			echo -e "\n------------------------------------\n"
			free_ram	
			echo -e "\n------------------------------------\n"
			;;
		"5")
			echo -e "\n------------------------------------\n"
			disk_size
			echo -e "\n------------------------------------\n"
			;;
		"6")	
			main					
			;;
		*)
			echo -e "\n-------------------"
                	echo -e "\nInvalid Input"	
			echo -e "\n-------------------"	
			;;

	esac
done	
}

function main(){
while true ;
do

	echo -e "\n+++++++++++++++++++++++++++++++++++++++"
	echo -e "\nLinux Enum [Kernal Ver.$(uname -r)]"
	echo -e "\n+++++++++++++++++++++++++++++++++++++++"	
	printf "\n 1. Auto Enum \n 2. Manual Enum \n 3. Exit \n"
	read -p "Enter Input : " a
	echo -e "\n-------------------------------------------\n"

	case "$a" in
		"1")
			cpu_main
			;;
		"2")
			manual_enum		
			;;
		"3")
			exit 0
			;;
		*)
			echo -e "\n----------------"
			echo -e "\nInvalid Input"
			echo -e "\n----------------"
			;;
	esac
done
}
main