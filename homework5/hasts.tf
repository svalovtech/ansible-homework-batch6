# ohio ansible_host=Public IPv4 address
# virginia ansible_host=Public IPv4 address
# california ansible_host=Public IPv4 address
# oregon ansible_host=Public IPv4 address

# type for ping pong <ansible all -m ping -i hosts>
# type fore role <ansible-galaxy init (name role)>

# type for dynamic <sudo apt install python3-pip>   for dynamic inventory in aws 
# after instal pip you need run <pip install boto3>
# then type <pip show boto3>
# and type <pip show botocore>
                                                                    # REQUIREMENTS: 
                                                                                    #python >= 3.6
                                                                                    #boto3 >= 1.26.0
                                                                                    #botocore >= 1.29.0
# Synopsis
# Get inventory hosts from Amazon Web Services EC2.

# The inventory file is a YAML configuration file and must end with aws_ec2.{yml|yaml}. Example: hosts.aws_ec2.yml.





