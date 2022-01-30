# NeDaGen - A Network Dataset Generator
This tool builds a network with a user-defined size and profile. It can be scaled to approximately 1000 containers and the characteristics of the network can be easily modified. It also incorporates Atomic-operator to generate malicious network traffic (based on the MITRE ATT&CK framework). All corresponding traffic is captured in PCAP(s)/JSON format for further data analysis. 

Protocols in the dataset:
- ICMP
- OSPF
- BGP
- ARP
- DNS
- HTTP
- HTTPS
- SSH
- WG
- SMB
- FTP

Profiles:
- Developers
- Admins
- Operations


### Support: 
Verified and tested on:
```bash
Distributor ID: Ubuntu
Description:    Ubuntu 20.04.3 LTS
Release:        20.04
Codename:       focal
```

## GETTING STARTED

### Prerequisites
This project relies on Ansible, Docker and Containerlab. Ansible must be installed manually prior to running the project:
```bash
sudo python get-pip.py
sudo python -m pip install ansible
```

### Installation
1. Signup to [Dockerhub](https://hub.docker.com/) - credentials are required

2. Clone this repo:
```git clone https://ci.tno.nl/gitlab/smd/purplecontainerlab/code nedage```

3. Enter the cloned directory:
```cd nedage```

4. Fill in config.yml

5. Run the playbook:
```ansible-playbook playbook.yml --ask-become-pass```


## Usage


### Notes
WAN clients and Attacker nodes do not have internet access after initialization



## Roadmap
- [ ] Attacker Story
  - [ ] Initial Access
  - [ ] Lateral Movement
  - [ ] Sub-task 3

## License
This tool is fully open source. It does rely on containerlab which is made by Nokia and licensed under the BSD 3-Clause License and the open source Atomic Red Team.



## Contact
Dennis van Wijk - dwijk@os3.nl
Jeroen van Saane - jsaane@os3.nl



