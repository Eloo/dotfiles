#!/bin/bash
# https://www.jetbrains.com/go/download/download-thanks.html?type=eap 
#     https://www.jetbrains.com/go/download/data.services.jetbrains.com/products/download?code=GO

func ()
{
	local SCRIPTUSER=${SUDO_USER}
    local VERSION="173.3727.24"
    local FILETAR="goland-${VERSION}.tar.gz"
    local UNTARFOLDERNAME="GoLand-${VERSION}"
    local INSTALLPATH="/usr/goland"
    local SOURCEURL="https://download-cf.jetbrains.com/go/${FILETAR}"

	 # setup folders
    if [ ! -f ${INSTALLPATH} ]; then
    	sudo mkdir -p ${INSTALLPATH}
    fi

    if test "$SCRIPTUSER" = "" || test "$SCRIPTUSER" = "root"; then
    	 SCRIPTUSER=${USER}
    fi

    echo "user set to $SCRIPTUSER"

    # change directory to tmp
    cd /tmp/

    # Download the sources if file does not exist
    if [ ! -f /tmp/${FILETAR} ]; then
    	sudo wget ${SOURCEURL}
    fi

    # unpack tar
    sudo tar -xvf ${FILETAR}

    # Install to /usr/local
    sudo rsync -av ${UNTARFOLDERNAME}/ ${INSTALLPATH}/

	sudo chmod +x /usr/goland/bin/goland.sh


	local APPSHORTCUT="[Desktop Entry]
	  Name=goland
	  Comment=goland
	  Exec=/usr/goland/bin/goland.sh
	  Icon=/usr/goland/bin/goland.png
	  Terminal=false
	  Type=Application
	  Encoding=UTF-8
	  Categories=Utility"

	sudo touch /usr/share/applications/goland.desktop
	sudo echo "${APPSHORTCUT}" > /usr/share/applications/goland.desktop

	sudo chmod +x /usr/share/applications/goland.desktop

	sudo rm -rf Go*
	sudo rm -rf go*

}
func