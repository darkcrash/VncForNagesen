# Custom Script for Linux

wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
sudo wget https://www.ubuntulinux.jp/sources.list.d/trusty.list -O /etc/apt/sources.list.d/ubuntu-ja.list

sudo apt-get update -y 
sudo apt-get update -y 

sudo apt-get -y install ubuntu-defaults-ja language-pack-ja
sudo apt-get -y install supervisor xvfb lxde ttf-ubuntu-font-family mesa-utils libgl1-mesa-dri
sudo apt-get -y install firefox firefox-locale-ja X11vnc noVNC git
sudo apt-get -y remove xscreensaver

cd /
sudo git clone https://github.com/kanaka/noVNC.git


# create vncuser
sudo useradd --create-home --shell /bin/bash --user-group --groups adm,sudo vncuser &>/dev/null

# supervisord 
sudo rm -f /etc/supervisor/conf.d/svvnc.conf

sudo sh -c "echo '[program:xvfb1]' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'priority=10' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'directory=/' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'command=/usr/bin/Xvfb :1 -screen 0 1024x768x24' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'user=root' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'autostart=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'autorestart=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stopsignal=QUIT' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stdout_logfile=/var/log/xvfb1.log' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'redirect_stderr=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo '' >> /etc/supervisor/conf.d/svvnc.conf"

sudo sh -c "echo '[program:lx1]' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'priority=15' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'directory=/home/vncuser' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'command=/usr/bin/lxsession' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'user=vncuser' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'autostart=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'autorestart=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stopsignal=QUIT' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'environment=DISPLAY=":1",HOME="/home/vncuser"' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stdout_logfile=/var/log/lxsession1.log' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'redirect_stderr=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo '' >> /etc/supervisor/conf.d/svvnc.conf"

sudo sh -c "echo '[program:x11vnc1]' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'priority=20' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'directory=/' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'command=x11vnc -display :1 -xkb -forever -shared -rfbport 5900 -viewonly' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'user=root' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'autostart=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'autorestart=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stopsignal=QUIT' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stdout_logfile=/var/log/x11vnc.log' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'redirect_stderr=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo '' >> /etc/supervisor/conf.d/svvnc.conf"

sudo sh -c "echo '[program:novnc1]' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'directory=/noVNC' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'command=/noVNC/utils/launch.sh --listen 6080 --vnc localhost:5900' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'user=root' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'autostart=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'autorestart=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stopsignal=TERM' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stdout_logfile=/var/log/novnc1.log' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'redirect_stderr=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stopasgroup=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo '' >> /etc/supervisor/conf.d/svvnc.conf"

sudo sh -c "echo '[program:firefox]' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'directory=/home/vncuser' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'command=firefox --display=:1 http://naas.azurewebsites.net/CreateNewRoom' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'user=vncuser' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'autostart=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'autorestart=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stopsignal=TERM' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stdout_logfile=/var/log/firefox.log' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'redirect_stderr=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo 'stopasgroup=true' >> /etc/supervisor/conf.d/svvnc.conf"
sudo sh -c "echo '' >> /etc/supervisor/conf.d/svvnc.conf"

sudo service supervisor start

# LXDE autostart
# sleep(5)
# sudo -u vncuser mkdir -p /home/vncuser/.config/lxsession/LXDE/
# sudo rm -f /home/vncuser/.config/lxsession/LXDE/autostart
# sudo sh -c "echo '@lxpanel --profile LXDE' >> /home/vncuser/.config/lxsession/LXDE/autostart"
# sudo sh -c "echo '@pcmanfm --desktop --profile LXDE' >> /home/vncuser/.config/lxsession/LXDE/autostart"
# sudo sh -c "echo '@/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1' >> /home/vncuser/.config/lxsession/LXDE/autostart"
# sudo sh -c "echo '@firefox http://naas.azurewebsites.net/CreateNewRoom' >> /home/vncuser/.config/lxsession/LXDE/autostart"
# sudo service supervisor stop
# sleep(5)
# sudo service supervisor start

