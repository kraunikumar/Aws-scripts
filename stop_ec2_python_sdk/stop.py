#/usr/bin/python
import boto.ec2
import json
import requests

def id_instance():
    response = requests.get('http://169.254.169.254/latest/meta-data/instance-id')
    instance_id = response.text
    return instance_id
#print(id_instance())
instance = id_instance()
response = requests.get('http://169.254.169.254/latest/dynamic/instance-identity/document')

json_data=json.loads(response.text)
region=json_data['region']
#print region
conn = boto.ec2.connect_to_region(region)
conn.stop_instances(instance_ids=[instance])
