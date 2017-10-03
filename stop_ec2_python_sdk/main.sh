sudo su
#installing the dependiences 
yum install python python-devel python-pip
python-pip install boto

#changing time zone to pacific
cd ~
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/US/Pacific /etc/localtime

#editing crontab file
echo "#you instance will shutdown at 10.01 pm pst" >> /etc/crontab
echo "01 22 * * * root /usr/bin/python /home/ec2-user/Aws-scripts/stop_ec2_python_sdk/stop.py" >> /etc/crontab

