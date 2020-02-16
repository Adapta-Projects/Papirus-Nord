#!/bin/bash

PREFIX="Icons"
LOCAL="/usr/share/icons/Papirus"

echo -e "\nWelcome to Papirus Custom Folder installer!"
echo -e "\tFor better usage, run this script using root user!"

if [ ! $USER = "root" ]
then
    if [ ! -d /home/$USER/.icons/Papirus ]
    then
        echo "Install first the papirus icon!"
        exit 0
    else
        echo "Papiruc icon already installed!"
        LOCAL = "/home/$USER/.icons/Papirus"
    fi
else
    if [ ! -d $LOCAL ]
    then
        echo "Install first the papirus icon!"
        exit 0
    else
        if [ ! -f /usr/bin/papirus-folders ]
        then
            echo "Papirus-folders script not is installed!"
            cp /usr/bin papirus-folders
            echo "Papirus-folders script installed!"
        else
            echo "Papirus-folders already installed!"
            echo "Appling patch in papirus-folders..."
            diff -Naur /usr/bin/papirus-folders papirus-folders > Patch.patch
            patch /usr/bin/papirus-folders < Patch.patch
            echo "Patch applied!"
        fi
    fi
fi

echo "Instaling icons..."
cp $PREFIX/64x64/* $LOCAL/64x64/places
cp $PREFIX/48x48/* $LOCAL/48x48/places
cp $PREFIX/32x32/* $LOCAL/32x32/places
cp $PREFIX/24x24/* $LOCAL/24x24/places
cp $PREFIX/22x22/* $LOCAL/22x22/places
echo "Icons installed!"
