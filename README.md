Role Name
=========

deploy-awx-k3s-ubuntu

A quick way to deploy a single node k3s cluster running AWX.

Requirements
------------

Ubuntu 20.04/22.04

8 GB RAM

4 CPU

Role Variables
--------------

k3s_version: The k3s release to deploy, default is v1.21.9+k3s1 because I had

stability issues using later versions, your mileage may vary.


operator_version: The awx operator release, default 0.26.0

awx_version: AWX release, default 21.4.0


After testing multiple scenarios, I have found this combination to be rock solid.

Example Playbook
----------------

deploy.yml can be used to execute against an inventory

ansible-playbook -i YourInventoryFile deploy.yml


License
-------

GPL V3

Author Information
------------------

Name: Michael Nelson

LET'S GET IT AUTOMATED AND BE LAZY :<)
