#! /bin/bash

sudo apt install -y wget vim openjdk-8-jdk

sudo useradd --create-home wf
sudo usermod --shell /bin/bash wf

echo >> wf.service
echo "[Unit]" >> wf.service
echo'Description=wf' >> wf.service
echo  >> wf.service
echo "[Service]" >> wf.service
echo 'User=wf' >> wf.service
echo 'WorkingDirectory=/home/wf' >> wf.service
echo 'ExecStart=/home/wildfly-10.1.0.Final/bin/standalone.sh' >> wf.service
echo  >> wf.service
echo "[Install]" >> wf.service
echo 'WantedBy=multi-user.target' >> wf.service

sudo mv wf.service /etc/systemd/system/wf.service

sudo su - wf -c "wget https://download.jboss.org/wildfly/10.1.0.Final/wildfly-10.1.0.Final.tar.gz"


sudo systemctl daemon-reload

sudo systemctl start wf
sudo systemctl enable wf