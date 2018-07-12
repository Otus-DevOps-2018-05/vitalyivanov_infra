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

## Homework 4

testapp_IP = 35.187.175.216

testapp_port = 9292

<b>Command to create firewall rule:</b>
```bash
gcloud compute firewall-rules create default-puma-server --target-tags="puma-server" --source-ranges="0.0.0.0/0" --allow tcp:9292
```

<b>Create VM instance with a startup script execution:</b>
```bash
gcloud compute instances create reddit-app-with-startup-script \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=startup.sh
```

## Homework 5

packer folder contains packer template to create base GCP image with dependencies to run Reddit-like app.
It can be run with the following command:
```bash
packer build -var-file <variables-file-name> ubuntu16.json
``` 
config-scripts/create-reddit-vm.sh file can be used to create GCP VM instance from created in the previous step image.