#### RP1
Private repo to keep track of code for RP1

For now it only works on ubuntu Impish, Hirsute, focal and bionic, with python3 as ansible interpreter

[Dockerhub](https://hub.docker.com/) credentials are required

- Clone this repo:
```git clone https://gitlab.os3.nl/jsaane/RP1.git```

- Run the playbook:
```ansible-playbook RP1/playbook.yml --ask-become-pass```

A already running network will be deleted when this playbook is run again, you have a small timewindow to then not further continue building a new network.

The 

*This tool uses containerlab which is made by Nokia and licensed under the BSD 3-Clause License*
