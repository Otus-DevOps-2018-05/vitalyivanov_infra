# vitalyivanov_infra
vitalyivanov Infra repository

## Homework 3

### IP Addresses

bastion_IP = 35.228.237.37

someinternalhost_IP = 10.166.0.3

### Connect to <i>someinternalhost</i> with one command

```bash
ssh -i ~/.ssh/gcp -A -J vitaly@35.228.237.37 10.166.0.3
```

### Additional task: connect to <i>someinternalhost</i> with alias

Add following lines to the ~/.ssh/config file

```bash
Host someinternalhost
    HostName 10.166.0.3
    User vitaly
    ProxyJump vitaly@35.228.237.37   
```

Run command:

```bash
ssh someinternalhost
```

