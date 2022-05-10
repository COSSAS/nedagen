<div align="center">
<a href="https://gitlab.com/cossas/nedagen/-/tree/master"><img src="docs/nedagen-logo.jpg" height="100px" />

![Website](https://img.shields.io/badge/website-cossas--project.org-orange)
![Commits](https://gitlab.com/cossas/nedagen/-/jobs/artifacts/master/raw/commits.svg?job=create_badge_svg)
![Pipeline status](https://gitlab.com/cossas/nedagen/badges/master/pipeline.svg)
<!-- ![License: MPL2.0](https://gitlab.com/cossas/certitude/-/jobs/artifacts/master/raw/license.svg?job=create_badge_svg) -->
</div></a>

<hr style="border:2px solid gray"> </hr>
<div align="center">
A Network traffic Dataset Generator for Network-based Intrusion Detection Systems
</div>
<hr style="border:2px solid gray"> </hr>

_All COSSAS projects are hosted on [GitLab](https://gitlab.com/cossas/nedagen/) with a push mirror to GitHub. For issues/contributions check [CONTRIBUTING.md](https://gitlab.com/cossas/home/-/blob/main/CONTRIBUTING.md)_ 

This tool builds a network with a user-defined size and profile. It can be scaled to approximately 1,000 containers and the characteristics of the network can be easily modified. It also incorporates [Atomic-operator](https://www.atomic-operator.com/) to generate malicious network traffic (based on the [MITRE ATT&CK framework](https://attack.mitre.org/)). All corresponding traffic is captured in PCAP(s)/JSON format for further data analysis. 

### Protocols in the dataset
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
- LDAP

### Profiles
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

## Getting started
Various parameters can be given in **config.yml** to shape the network to fit your needs, below the defaults are listed:

```
networkname: "network"               # How should the new network be called
NumberofLANclients: "6"              # How many LAN clients do you want to simulate?
NumberofWANclients: "6"              # How many WAN clients do you want to simulate?
DevsPercentage: "40"                 # What percentage of your LAN makes up Development?
AdminPercentage: "40"                # What percentage of your LAN makes up Administration?
OpsPercentage: "20"                  # What percentage of your LAN makes up Operations?
savefile: "pcap"                     # Do you want to capture the network traffic? if so, in which fileformat do you want to have it? 'not', 'json', 'pcap', or 'both'
capturelimit: "0"                    # If you chose to capture network traffic, what size may the combined captures take (in MBs or GBs)? The network will automatically be stopped when this limit is reached. '6M' '6G' (0 = unlimited)
timer: "0"                           # How long may the network (+-capture) stay running? for example: '6m' (6 minutes) '6h' (6hours) '6d' (6 days), (0 = unlimited)

### Departments and corresponding ALS Profiles weights 
ALS_developers_weight_web: "0.3"          # Set WEB Traffic Generation Weight
ALS_developers_weight_smb: "0.2"          # Set SMB Traffic Generation Weight
ALS_developers_weight_ssh: "0.2"          # Set SSH Traffic Generation Weight
ALS_developers_weight_ftp: "0.2"          # Set FTP Traffic Generation Weight
ALS_developers_weight_mail: "0.1"         # Set MAIL Traffic Generation Weight

ALS_administration_weight_web: "0.4"      # Set WEB Traffic Generation Weight
ALS_administration_weight_smb: "0.3"      # Set SMB Traffic Generation Weight
ALS_administration_weight_ssh: "0.1"      # Set SSH Traffic Generation Weight
ALS_administration_weight_ftp: "0.1"      # Set FTP Traffic Generation Weight
ALS_administration_weight_mail: "0.1"     # Set MAIL Traffic Generation Weight

ALS_operations_weight_web: "0.5"          # Set WEB Traffic Generation Weight
ALS_operations_weight_smb: "0.2"          # Set SMB Traffic Generation Weight
ALS_operations_weight_ssh: "0.1"          # Set SSH Traffic Generation Weight
ALS_operations_weight_ftp: "0.1"          # Set FTP Traffic Generation Weight
ALS_operations_weight_mail: "0.1"         # Set MAIL Traffic Generation Weight
```

### Prerequisites
This project relies on Ansible, Docker and Containerlab. Ansible must be installed manually prior to running the project:
```bash
sudo python get-pip.py
sudo python -m pip install ansible
```

### Installation
1. Signup to [Dockerhub](https://hub.docker.com/) - credentials are required

2. Clone this repo:
```git clone https://gitlab.com/cossas/nedagen.git NeDaGen```

3. Enter the cloned directory:
```cd NeDaGen```

4. Fill in config.yml

5. Run the playbook:
```ansible-playbook playbook.yml --ask-become-pass```

## Usage
Required packages such as Docker, Python and pip will automatically be installed when you run this script. If you are running this for the first time, the build (with the default parameters in config.yml) will take approximately 10 minutes depending on the resources of your system.

The network structure is defined in **network.yml**, here containers can be added, be it a simple linux alpine container or a virtualized router.
All features that are available are to be found at [containerlab](https://containerlab.srlinux.dev/).
To continue on the IaC concept and made structure, folders and files that are needed by containers need to be added in the repository and a task must be made to copy these to the working network's folder. This is done in the *3_setup-topology/tasks/main.yml* file.

To add other traffic, add the requirements on the LAN client's containers to the appropriate script: *4_run-and-configure*. The script itself to generate traffic must be added in: *3_setup-topology/files/*traffic-generation* or inside *3_setup-topology/templates*. Furthermore, it should be added in the cronjobs in *4_run-and-configure/templates/cronjobs_** and added to the profiles *3_setup-topology/templates/profiles/ALS_profiles_* and *config.yml*.

### Notes
WAN clients and Attacker nodes do not have internet access after initialization

## Roadmap
- [ ] IPv6 support
- [ ] Selectable runtime environment

## License
This tool is fully open source. It does rely on [containerlab](https://github.com/srl-labs/containerlab) and [Atomic-operator](https://www.atomic-operator.com/) are respectively licensed under the BSD 3-Clause License and MIT License.

## Contributing
This project welcomes contributions of all types. Helping with expanding the attack scenarios, improving the network architecture, writing documentation, finding bugs and more, everyone can help.

## Code of Conduct
Every contribution will be checked before being released. All attacks must be specified with the corresponding [MITRE ATT&CK techniques](https://attack.mitre.org/techniques/enterprise/). The full code of conduct can be found at [COSSAS](https://gitlab.com/cossas/home/-/blob/main/CODE_OF_CONDUCT.md).

## Contact
Dennis van Wijk - denvanwijk@gmail.com \
Jeroen van Saane - contact@jeroenvansaane.com



