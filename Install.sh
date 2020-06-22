echo "####Drx. jagrat kori 💘 Er.Ryzen kori####"

echo "########Performing update########"
apt-get update



echo "########Installing xfce4 environment########"
apt-get install kali-defaults kali-root-login desktop-base xfce4 xfce4-places-plugin xfce4-goodies

apt-get install lightdm

dpkg-reconfigure lightdm

echo "########Installing tightvncserver########"
apt-get install tightvncserver

echo "########Autostart script for VNC########"
read -p "Enter your display resolution for VNC session (i.e. 800x600, 1024x768):- " tc_server 
read -p "Enter depth for VNC session (i.e. 16, 24, 32):- " tc_depth
cd /etc/init.d/
if [ -f techchipvncsetup ]
then
rm techchipvncsetup
update-rc.d techchipvncsetup remove
fi
echo "#!/bin/sh
### BEGIN INIT INFO
# Provides: tightvncserver
# Required-Start: \$local_fs \$remote_fs \$syslog
# Required-Stop: \$local_fc \$remote_fs \$syslog
# Default-Start: 2 3 4 5# Default-Stop: 0 1 6# Short-Description: auto setup vnc server
# Description: auto setup vncserver in kali linux for rpi
#
### END INIT INFO# /etc/init.d/techchipvncsetup
USER=root
HOME=/root
export USER HOME
case" '$1' "in
start)
/usr/bin/vncserver :1 -geometry" $tc_server" -depth" $tc_depth"
;;
stop)
pkill Xtightvnc
;;
*)
exit ,1
;;
esac
exit 0
" > techchipvncsetup
echo ""
echo "########Setup autostart script########"
echo "Wait..."; sleep 2;
chmod +x techchipvncsetup
update-rc.d techchipvncsetup defaults
echo "Congratulation your VNC auto start setup successfully completed"
echo "########Vnc server setup done########"
Mkdir /root/.config/autostart

echo "will be fixed after reboot"

echo ""

echo "########Installing wifite########"
apt-get install wifite

echo ""

echo "########Enabling autologin########" 
mv /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bakmv /etc/pam.d/lightdm-autologin /etc/pam.d/lightdm-autologin.bakcp lightdm.conf /etc/lightdm/lightdm.confcp lightdm-autologin /etc/pam.d/lightdm-autologin

echo ""

