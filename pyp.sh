#!/usr/bin/bash

if ! command -v git ;
then
	sudo pacman -S git
fi


clear
NAME=""
echo "Project name: "
read NAME

# creating dir
mkdir $NAME
cd $NAME
mkdir "src"


# selecting deps
clear
echo "Should use pytext ? (y/n)"
PYTEXT=""
read PYTEXT

cd src
clear
echo "Should use pyjoy ? (y/n)"
PYJOY=""
read PYJOY

# cloning dependencies
if [ $PYTEXT = "y" ];
then
	git clone https://github.com/bendikMichal/pytext
fi

if [ $PYJOY = "y" ];
then
	git clone https://github.com/bendikMichal/pyjoy
fi

# creating main
cd ..
touch main.py
echo "import pygame, sys" > main.py

if [ $PYTEXT = "y" ];
then
	echo "sys.path.insert(1, \"src/pytext\")" >> main.py
	echo "import text" >> main.py
fi

if [ $PYJOY = "y" ];
then
	echo "sys.path.insert(1, \"src/pyjoy/data/scripts\")" >> main.py
	echo "import joystickHandler" >> main.py
fi

echo "" >> main.py
echo "width, height = 640, 480" >> main.py
echo "Window = pygame.display.set_mode((width, height))" >> main.py
echo "" >> main.py
echo "running = True" >> main.py
echo "" >> main.py
echo "while running:" >> main.py
echo "	for event in pygame.event.get():" >> main.py
echo "		if event.type == pygame.QUIT:" >> main.py
echo "			running = False" >> main.py
echo "	Window.fill((0, 0, 0))" >> main.py
echo "	pygame.display.update()" >> main.py
echo "" >> main.py
echo "pygame.quit()" >> main.py
echo "sys.exit()" >> main.py








