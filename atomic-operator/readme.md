# Atomic Operator
This page contains the installation instructions and basic setup for running atomic-operator.

## Installation
The following instructions can be followed: https://github.com/swimlane/atomic-operator


## Configuration File
These are yaml files. For further options inside the config file, such as using ssh keys, usernames and passwords, refer to: https://github.com/swimlane/atomic-operator

A simple remote file has the following format:

```yaml
inventory:
  windows1:
    executor: cmd # or cmd
    authentication:
      username: username
      password: password
      verify_ssl: false
    hosts:
      - 192.168.1.1

  linux1:
    executor: ssh
    authentication:
      username: username
      password: password
      #ssk_key_path:
      port: 22
      timeout: 5
    hosts:
      - 172.17.0.3
      # - 10.32.100.1


atomic_tests:
  - guid: 3723ab77-c546-403c-8fb4-bb577033b235
    # input_arguments:
    #   second_arg:
    #     value: pwd
    inventories:
      - linux1
  - guid: 60e860b6-8ae6-49db-ad07-5e73edd88f5d
    inventories:
      - linux1
    input_arguments:
      output_file:
        value: custom_output.txt
```

For remote tests, an inventory must be used that specifies the hosts against which the techniques should be ran. 


## Running Tests
This can be done based upon a command or by a config file. 

Running with a config can be done like so:
```bash
sudo atomic-operator run --config_file=config.yml --config_file_only=true
```

This will only execute the techniques that are specified inside the configuration (note the --config_file_only parameter).


The expected output for this specific test looks along the lines of this:
```bash
sudo atomic-operator run --config_file=config.yml --config_file_only=true 
INFO:Base.AtomicOperator:Running Access /etc/shadow (Local) test (3723ab77-c546-403c-8fb4-bb577033b235) for technique T1003.008
INFO:paramiko.transport:Connected (version 2.0, client OpenSSH_8.2p1)
INFO:paramiko.transport:Authentication (password) successful!
INFO:Base.Runner:

Output: root:$6$[...]]99999:7:::
daemon:*:18997:0:99999:7:::
bin:*:18997:0:99999:7:::
sys:*:18997:0:99999:7:::
sync:*:18997:0:99999:7:::
games:*:18997:0:99999:7:::
[...]
```

## Techniques
An index of the available techniques (in various formats) can be found here: https://github.com/redcanaryco/atomic-red-team/tree/master/atomics/Indexes


A markdown representation can be found here: https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/Indexes/Indexes-Markdown/index.md


### Modifying the Config
The first step is to select the technique. Each technique contains an "auto_generated_guid" which can be specified inside the configuration yaml like so:

```yaml
atomic_tests:
  - guid: 3723ab77-c546-403c-8fb4-bb577033b235
```


