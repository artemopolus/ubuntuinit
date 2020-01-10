#!/bin/bash
sudo apt-get install cmake
sudo apt-get install git
sudo apt-get install gcc
sudo apt-get install g++
sudo apt-get install doxygen doxygen-latex
sudo apt-get install tmux screen
I=`dpkg -s sublime-text | grep "Status" ` #проверяем состояние пакета (dpkg) и ищем в выводе его статус (grep)
if [ -n "$I" ] #проверяем что нашли строку со статусом (что строка не пуста)
then
   echo "sublime-text installed" #выводим результат
else
   	echo "sublime-text not installed"
   	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

	sudo apt-get install apt-transport-https

	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

	sudo apt-get update

	sudo apt-get install sublime-text
fi

#file space
if [ -d workspace ]
then
	echo "Dir workspace exists"
else
	echo "workspace not exists. Create"
	mkdir workspace
fi

 

I=`dpkg -s rsync | grep "Status" `
if [ -n "$I" ] 
then
	echo "rsync installed" 
else
	sudo apt-get install rsync
fi


I=`dpkg -s python | grep "Status" `
if [ -n "$I" ] 
then
	echo "python installed" 
else
	sudo apt-get install python python-pip
fi

I=`dpkg -s python3 | grep "Status" `
if [ -n "$I" ] 
then
	echo "python3 installed" 
else
	sudo apt-get install python3
fi

I=`dpkg -s python3-pip | grep "Status" `
if [ -n "$I" ] 
then
	echo "python3-pip installed" 
else
	sudo apt-get install python3-pip
fi


echo "Done!"
