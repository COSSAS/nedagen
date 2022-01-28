#### NeDaGe

Network Dataset Generator based on Docker

This tool builds a network with a user defined size and profile, and incorperates Atomic-operator to generate malicious traffic (based on the MITRE ATT&CK framework) into the network in order to generate PCAPs/ JSON network data in combination with the timestamps of the attacks to use them for identifying attacker traffic.

This tool allows you to scale to approximatly 1000 containers in an efficient and easy manner.

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

##Support: 
(kernel, distro, python version)

##GET STARTED

[Dockerhub](https://hub.docker.com/) credentials are required

- Clone this repo:
```git clone https://gitlab.os3.nl/jsaane/RP1.git```

- Go to the directory:
```cd code```

- Fill in config.yml

- Run the playbook:
```ansible-playbook playbook.yml --ask-become-pass```


WAN clients and Attacker nodes do not have internet access after initialization

*This tool is open source and works on containerlab which is made by Nokia and licensed under the BSD 3-Clause License and works with the open source Atomic Red Team*
