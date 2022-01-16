#### RP1
Private repo to keep track of code for Research Project "Purple Container Lab"

[Dockerhub](https://hub.docker.com/) credentials are required.

- Clone this repo:
```git clone https://gitlab.os3.nl/jsaane/RP1.git```

- Run the playbook:
```ansible-playbook playbook.yml --ask-become-pass```

An already running network will be deleted when this playbook is run again, you have a small timewindow to then not further continue building a new network.

*This tool uses containerlab which is made by Nokia and licensed under the BSD 3-Clause License*
