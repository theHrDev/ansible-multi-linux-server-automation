# Multi-Linux Server Automation with Terraform and Ansible

## Project Overview

This project demonstrates the provisioning and configuration management of multiple Linux servers on AWS using Terraform and Ansible.

Terraform was used to provision the cloud infrastructure, including the necessary networking resources and EC2 instances. Ansible was then used to automate package installation and perform basic server verification across three Linux servers running different operating systems.

The project consists of:
- One Amazon Linux server.
- Two Ubuntu servers.

## Project Objectives

- Provision AWS infrastructure using Terraform.
- Create and configure EC2 instances.
- Configure networking resources, including VPCs, subnets, Internet Gateway and Security Groups.
- Establish SSH connectivity between the Ansible control node and managed servers.
- Automate package installation across different Linux distributions.
- Use Ansible conditionals and loops to manage distribution-specific tasks.
- Verify the execution environment using Ansible's `whoami`, `hostname` and `debug` modules.

## Technologies Used

- **AWS:** Cloud infrastructure provider.
- **Terraform:** Infrastructure as Code (IaC).
- **Ansible:** Configuration management and automation.
- **Amazon Linux:** Linux distribution for the first managed server.
- **Ubuntu:** Linux distribution for the second and third managed servers.
- **Git & GitHub:** Version control and project hosting.

## Project Structure

```text
ansible-multi-linux-server-automation/
│
├── terraform/
│   ├── provider.tf
│   ├── vpc.tf
│   ├── ec2.tf
│   ├── sec-group.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── ansible/
│   ├── inventory.yml
    ├── ansible.cfg
│   └── install-packages.yml
│
├── README.md
└── .gitignore
```

## Infrastructure Provisioning with Terraform

Terraform was used to provision the AWS infrastructure required for the project.

The infrastructure includes:

- AWS VPC and subnet configuration.
- Internet Gateway for internet connectivity.
- Route table and subnet association.
- Security Groups for controlling network traffic.
- EC2 instances for the three managed servers.

### Server Configuration

| Server | Operating System | Package Manager |
|---|---|---|
| Server 1 | Amazon Linux | DNF |
| Server 2 | Ubuntu | APT |
| Server 3 | Ubuntu | APT |

## Configuration Management with Ansible

Ansible was used to automate package installation and execute verification tasks across the three managed servers.

### Inventory Configuration

An Ansible YAML inventory file was created to define all three managed servers under a group named `servers`.

### Playbook Tasks

The Ansible playbook performs the following tasks:

1. Targets all servers in the `servers` inventory group.
2. Identifies the operating system distribution using Ansible facts.
3. Uses conditional statements (`when`) to execute distribution-specific tasks.
4. Installs packages using loops.

### Package Installation

| Operating System | Packages | Package Manager |
|---|---|---|
| Amazon Linux | httpd, git, unzip | DNF |
| Ubuntu | apache2, git, unzip | APT |

### Server Verification

The playbook also:

- Executes the `whoami` command.
- Registers the command output.
- Displays the current user and hostname using Ansible's debug module.
- Displays different messages depending on the Linux distribution.

## Running the Project

### 1. Provision AWS Infrastructure

Navigate to the Terraform directory:

```bash
cd terraform
```

Initialize Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Review the execution plan:

```bash
terraform plan
```

Provision the infrastructure:

```bash
terraform apply
```

### 2. Configure Ansible

Navigate to the Ansible directory:

```bash
cd ../ansible
```

Test connectivity to the managed servers(the inventory route is in the configuration file):

```bash
ansible servers -m ping
```

### 3. Execute the Ansible Playbook

```bash
ansible-playbook install-packages.yml
```

## Expected Results

After successful execution:

- All three servers should be reachable through Ansible.
- The required packages should be installed according to each server's Linux distribution.
- The current user and hostname should be displayed.
- Distribution-specific messages should be displayed for Amazon Linux and Ubuntu.

## Challenges and Troubleshooting

During implementation, some of the challenges encountered included:

- Resolving AMI and EC2 instance architecture compatibility.
- Configuring VPCs, subnets and Security Groups correctly.
- Establishing network connectivity between the control node and managed servers.
- Configuring SSH access and Ansible connectivity.

These challenges provided practical experience in AWS networking, infrastructure provisioning and Linux server administration.

## Key Learnings

Through this project, I gained practical experience in:

- Infrastructure provisioning with Terraform.
- AWS networking and EC2 management.
- Linux server administration.
- Ansible inventory and playbook configuration.
- Conditional execution and loops in Ansible.
- SSH-based remote server management.
- Automating configuration tasks across multiple Linux distributions.

## Author

**Rukayat Abiodun**

Frontend Developer transitioning into Cloud and DevOps engineering.

[GitHub](https://github.com/theHrDev)
