- Min version: in case you use specific features that require a certain version of Packer (I rarely use this)
- Variables: User-defined variables. They can have a value, or can be empty (in which case you can add the value using the CLI when calling Packer)
- Builders: Define what providers to use as builders (We'll use amazon-ebs to create a AMI we can use for launching ec2 instances)
- Provisioners: Essentially the scripts we run on the server to set everything up the way we want it

# Builders

- We could simply tell Packer that directly via "source_ami":"ami-07c1207a9d40bc3bd", but we'll instead use a filter to find the latest AMI for our use case.

- We'll use the (standard) Packer Builder amazon-ebs. You can see all available [builders here](https://developer.hashicorp.com/packer/plugins/builders/amazon).

Here's how you make an AMI in AWS:

1. Create a server with an EBS root drive
   - EBS (Elastic Block Storage) are the disk drives in AWS
1. Install and configure the server however you'd like
1. Create a snapshot of the EBS root volume
1. Convert that snapshot to an AMI

- We'll ask Packer to use a filter (using the AWS API) to find the latest Ubuntu 20.04 AMI created by Canonical.

- We tell Packer how base image to use and how to create it (giving it an 8gb EBS drive, for example).

- We also tell Packer to give the AMI we create some tags to be applied when it is created.

- Tagging resources is super important in AWS to help search for resources, segment them (e.g. by environment), and for cost allocation and reporting.
