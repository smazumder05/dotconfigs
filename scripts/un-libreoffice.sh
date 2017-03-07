#Remove libre-office and its components
sudo apt-get remove --purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove
#Remove all fonts used by Libre
sudo apt-get remove fonts-opensymbol libreoffice libreoffice-\* openoffice.org-dtd-officedocument1.0 python\*-uno uno-libs3-\* ure ure-dbg
