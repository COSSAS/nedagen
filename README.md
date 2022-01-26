#### RP1
Private repo to keep track of code for Research Project "Purple Container Lab"

Support: 
(kernel, distro, python versie)

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

Profiles:
- Developer
- Management

[Dockerhub](https://hub.docker.com/) credentials are required

- Clone this repo:
```git clone https://gitlab.os3.nl/jsaane/RP1.git```

- Go to the directory:
```cd code```

- Run the playbook:
```ansible-playbook playbook.yml --ask-become-pass```


*This tool uses containerlab which is made by Nokia and licensed under the BSD 3-Clause License*
