# NeDaGen - A Network Traffic Dataset Generator
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
- SMTP

Profiles:
- Developers
- Admins
- Operations


### Support
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
The network structure is defined in **network.yml**, here containers can be added, be it a simple linux alpine container or a virtualized router.
All features that are available are to be found at [containerlab](https://containerlab.srlinux.dev/)
To continue on the IaC concept and made structure, folders and files that are needed by containers need to be added in the repository and a task must be made to copy these to the working networks folder. This is done in the *3_setup-topology/tasks/main.yml* file.

To add other traffic, add the requirements on the LANclients containers to the appropiate script: *4_run-and-configure*. The script itself to generate traffic must be added in: *3_setup-topology/files/*traffic-generation* or inside *3_setup-topology/templates*. Furthermore, it should be added in the cronjobs in *4_run-and-configure/templates/cronjobs_** and added to the profiles *3_setup-topology/templates/profiles/ALS_profiles_* and *config.yml*.

### Notes
WAN clients and Attacker nodes do not have internet access after initialization

## Roadmap
- [ ] IPv6 support
- [ ] Selectable runtime environment

## License
This tool is fully open source. It does rely on [containerlab](https://github.com/srl-labs/containerlab) and Atomic-operator are respectively licensed under the BSD 3-Clause License and MIT License.

## Contributing
This project welcomes contributions of all types. Helping with expanding the attack scenarios, improving the network architecture, writing documentation, finding bugs and more, everyone can help.

## Code of Conduct
Every contribution will be checked before being released. All attacks must be specified with the corresponding MITRE ATT&CK techniques

## Contact
Dennis van Wijk - dennis.van.wijk@student.uva.nl
Jeroen van Saane - jeroen.van.saane@student.uva.nl



