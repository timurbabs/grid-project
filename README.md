## Capstone project
TODO list:
- [x] Promotion job
- [x] Docker proxy
- [ ] Job to generate other jobs
- [ ] Multibranch pipeline
- [x] Bring the project structure and code to beauty using Ansible best practices

Improvement list:
- [ ] ApacheBench(JMeter) - load test functional behavior and measure performance
- [x] Terraform - AWS infrastructure as code
- [ ] Molecule - write tests, must have skill and tool
- [ ] Kubernetes - deploy using it, not Docker
- [ ] Prometheus -  monitoring and alerting, must have skill and tool


# PetClinic
## _Readme.md_

## Installation

Requires [Terraform](https://www.terraform.io/) v0.12+, [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) v2.11+ to run.

Clonning repository
```sh
git clone https://github.com/timurbabs/grid-project.git
cd grid-project
```

Generate AWS key in your AWS account.
Change Access and Secret keys in grid-project/vars.tf
```
***REMOVED***
***REMOVED***
  default = "YOUR_ACCESS_KEY_HERE"
***REMOVED***

***REMOVED***
***REMOVED***
  default = "YOUR_SECRET_KEY_HERE"
***REMOVED***
```

Also change owner of AWS property in grid-project/vars.tf
```
***REMOVED***
***REMOVED***
  default = "YOUR_NAME_HERE"
***REMOVED***
```
## Run terraform

```sh
terraform init
terraform plan
terraform apply
```

## Run Ansible Playbook
Default Ansible Vault password: "25447"

```sh
 ansible-playbook playbook.yml --ask-vault-pass
```

## Connect to Nexus

At first: add certificate ~/Documents/NexusSSL.pem to truststore.
Use Nexus public DNS name from inventory.yml and port 8443 to access Nexus.

## Connect to Jenkins

At first: add certificate ~/Documents/JenkinsSSL.pem to truststore.
Use Jenins public DNS name from inventory.yml and port 8443 to access Jenkins.

## Connect to Petclinic

Use DevProd public ip address from inventory.yml and port 8080 to access PetClinic.
