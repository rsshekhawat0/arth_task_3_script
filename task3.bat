aws ec2 create-key-pair --key-name shekhawat --query KeyMaterial --output text > shekhawat.pem

aws ec2 create-security-group --group-name rohan --description "aws cli task security group"

aws ec2 authorize-security-group-ingress --group-name rohan --protocol all --port all --cidr 0.0.0.0/0

aws ec2 run-instances --image-id ami-052c08d70def0ac62 --instance-type t2.micro --security-groups rohan --key-name shekhawat --query Instances[].InstanceId --output text > instanceid.text

aws ec2 create-volume --availability-zone ap-south-1a --size 1 --query VolumeId --output text> volumeid.text

timeout 25

set /p variable=<instanceid.text

aws ec2 attach-volume --device /dev/sdb --instance-id %variable% --volume-id file://volumeid.text
