Role Name
=========

**deploy-awx-k3s-ubuntu**

A quick way to deploy a single node k3s cluster running AWX.

Based on this article by Josphat Mutai:

https://computingforgeeks.com/how-to-install-ansible-awx-on-ubuntu-linux/

Requirements
------------

Ubuntu 20.04/22.04

8 GB RAM

4 CPU

Role Variables
--------------

**k3s_version**: The k3s release to deploy, default is v1.21.9+k3s1 because I had

stability issues using later versions, your mileage may vary.


**operator_version**: The awx operator release, default 0.26.0

**awx_version**: AWX release, default 21.4.0


After testing multiple scenarios, I have found this combination to be rock solid.

Admin password
----------------

The last task displays the admin password or SSH into the host and run:

```
kubectl get secret awx-admin-password -o go-template='{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'

```

Example Playbook
----------------

1. deploy.yml can be used to execute against an inventory

```
ansible-playbook -i YourInventoryFile deploy.yml

```
2. If using ansible-navigator with the config included in his repo,
   antuelle78/awx-ee:2.13.4 EE image is used and the container is launched on
   the host network.

```
ansible-navigator run deploy.yml -i YourInventoryFile

```

3. Add "-m stdout" to replicate ansible-playbook behaviour when using
   ansible-navigator

4. This repo can also be imported into an existing AWX/Tower instance as a project

5. Add "--skip-tags=k3s_install" to bypass reinstalling k3s on subsequent runs.

license
-------

GPLv3

Author Information
------------------

Name: Michael Nelson

LET'S GET IT AUTOMATED AND BE LAZY :<)
