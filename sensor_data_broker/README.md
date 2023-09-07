# Sensor data broker

This repository is part of the [Smart Home](https://github.com/StamenchoBog/smart-home) project.

## Description

This Git repository holds the content that will prepare and deploy a Mosquitto broker on a host on the LAN network. Later this host will be used to transfer sensor data from [Tasmota](https://tasmota.github.io/docs) devices (that are across the house) to the Cloud for processing. There are ansible scripts for hardening this host, and making it available only from the local network, so nobody can access in from outside.

## Technology and device stack

### Devices

#### RaspberryPi 4 (4 GB model)

Series of small single-board computers developed in the United Kingdom by the Raspberry Pi Foundation in association with Broadcom. The Raspberry Pi project originally leaned toward the promotion of teaching basic computer science in schools.

The device that we use will run on [RaspberryPi OS](https://www.raspberrypi.com/documentation/computers/os.html) which is optimized and tuned to work on a RaspberryPi device.

Check the following [page](https://www.raspberrypi.com/documentation/computers/getting-started.html) for more information and documentation on the device and the following [page](https://www.raspberrypi.com/documentation/computers/os.html) for documentation on the operation system.

### Technology stack

#### Ansible

Ansible is a suite of software tools that enables infrastructure as code. It is open-source and the suite includes software provisioning, configuration management, and application deployment functionality.

Check the following [page](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.4) for more information and documentation.

#### Tailscale

Tailscale is a VPN service that can help you manage and access private or shared resources from anywhere in the world It is a zero-config business VPN that rapidly deploy a WireGuard®-based VPN for your team's users, devices, and shared resources. It can be used for free to securely and remotely connect your homelab or personal dev environments.

Check the following [page](https://tailscale.com/kb/1017/install/) for more information and documentation.

#### Docker

Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers. The service has both free and premium tiers.

Check the following [page](https://docs.docker.com/get-started/) for more information and documentation.

#### Mosquitto

Eclipse Mosquitto is an open source (EPL/EDL licensed) message broker that implements the MQTT protocol versions 5.0, 3.1.1 and 3.1. Mosquitto is lightweight and is suitable for use on all devices from low power single board computers to full servers.

Check the following [page](https://mosquitto.org/documentation/) for more information and documentation.

## Guide

In order to prepare the Raspberry Pi device or any device running a Debian base OS (in this example Raspberry Pi OS) with aptitude as a package manages, you will need to follow the below steps.

1. Install ansible on broker
    - Run the `install_ansible.sh` script (located in {root-directory}/scripts/bash/) that will install ansible on the device, so you can control it and configure it using Ansible. Go into the folder where the script is located and run `ssh user@host 'bash -s' < /path/script.sh` in order to run in remotely.

2. Run the `01_add_ssh_user_and_key.yaml` that will execute the included playbooks which will install `firewalld` and upload a SSH key that will be later on used for connection. Don't forget to change the key on `line:36` located in the playbook, with the path to your desired SSH key.

3. Run the `02_patch_and_harden.yaml` playbook, that will execute the included playbook, which will patch and harden the operating system on the [RaspberryPi 4](#raspberrypi-4-4-gb-model), with the predefined community managed Ansible collection (can be viewed in this [repository](https://github.com/dev-sec/ansible-collection-hardening)). Also there are others setting and configuration that will restrict and change some of the defaults of the OS to make it more secure and only accessible from the LAN network.

4. Run the `03_install_requirements.yaml` playbook that will install Docker and [Tailscale](#tailscale), and other pre-requisites needed to connect the device to the external systems and also prepare the same one for application hosting.

5. Run the `04_start_applications.yaml` playbook which uses the Docker compose file defined in this repo (at the root level), which spins up a docker container running [Mosquitto](#mosquitto) broker that will forward the sensor data from the LAN network to the external systems.

### Tips for execution of scripts

Ansible scripts can be executing with one of the following commands:

```bash
# For ansible playbooks that will require a password to be entered to SSH connect to the host
ansible-playbook -i ../inventory.ini -k ansible_playbook.yml

# Ansible playbooks that will use the already placed SSH private key to connect to the host
ansible-playbook -i ../inventory.ini ansible_playbook.yml
```

## Lint checker

Install `yamllint` locally and run `yamllint *.yaml`, in order to see the errors and warnings with your yaml playbooks.

## Authors

- Stamencho Bogdanovski
  - Gitlab: [@sbogdanovski](https://gitlab.com/sbogdanovski)
  - Github: [@StamenchoBog](https://github.com/StamenchoBog)

## License

MIT License

Copyright (c) 2023 Stamencho Bogdanovski

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
