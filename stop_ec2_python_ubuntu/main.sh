#conditions for this script to work
#first : this workes only on ubuntu/Aws-scripts/stop_ec2_python_sdk/stop
#second: you clone the repo in location /home/ubuntu --> this is for aws if you are on server other than aws then edit second line in "editing crontab file "section 
#from "/home/ubuntu/Aws-scripts/stop_ec2_python_sdk/stop.py" and put your location for stop file 
sudo su
#installing the dependiences 
apt-get update
sudo apt-get install python-pip
sudo pip install boto
sudo pip install requests


#changing time zone to pacific
cd ~
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/US/Pacific /etc/localtime

#editing crontab file
echo "#you instance will shutdown at 10.01 pm pst" >> /etc/crontab
echo "01 22 * * * root /usr/bin/python /home/ubuntu/Aws-scripts/stop_ec2_python_sdk/stop.py" >> /etc/crontab

