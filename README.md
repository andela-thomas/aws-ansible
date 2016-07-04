# IAAS Learning exercise

## Tasks:
Accomplish the following tasks using ansible
- Hosting a static website on Amazon AWS using Amazon S3
- Creating a machine image on Amazon AWS
- Creating a VPC with a private & public subnet on Amazon AWS using AWS Cloudformation
- Launching a machine with the machine image created previously into the private subnet created above
- Creating an autoscaling group

This repo contains the above stated tasks implementation using cloudFormation.

To plat around with this implentation you need to have the following

1. [Boto sdk](https://aws.amazon.com/developers/getting-started/python/)
2. [Aws-cli](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)

create the following file `~/.boto` and add the following
```
[Credentials]
aws_access_key_id = YOUR_ACCESS_KEY_ID
aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
```

Then run `ansible -v playbook.yml`

Notice this documentation is bound to change.