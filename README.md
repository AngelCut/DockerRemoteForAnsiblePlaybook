# How to test a playbook with a Docker Container as a remote ?

This small tuto explains how a developer can easily test his Ansible Playbooks without impacting a remote server or - *if he wants to test what he did* - without impacting his own local workstation.

## Why ?

This is a very best practice to test things locally before you commit to whatever source repo. With Ansible Playbook it's the same: when creating/updating a Playbook - and before you execute it on a real server - it could be good to test if it doens't break the machine! :-)

But then we're probably looking for a solution which doesn't make our own dev workstation unstable. This is why we need to find a way to solve this out!

## How ?

Just put confidence in Docker which will help you to create a small container playing the role of whatever target server.
In case the playbook is wrong, then it will only affect the container which can be easily dropped! :-)

### Getting started with project DockerRemoteForAnsiblePlaybook

Just download this project to your local workstation and add an Ansible Playbook (* the whole Ansible "project"*) in the *resources/* folder.

Make sure the current folder is containing the `Dockerfile` then launch following command to let Docker work:
```shell
docker build --build-arg PLAYBOOK=<NAME_OF_PLAYBOOK>.yml .
```
**Just make sure the `<NAME_OF_PLAYBOOK>.yml` file is in the root `./resources`**

### So what ?

If the Playbook execution went fine, Docker should be able to create a final image. 
You can then use it to mount a Container and eventually connect to it in order to validate few things related to your Playbook installations.



THAT'S ALL FOLKS! :-)