## Ansible Interview Questions

<h5>Protocol used in Linux to connect ansible</h5>

SSH 

<h5>Protocol used in Windows to connect ansible</h5>

WinRM

<h5>Ansible v/s Chef</h5>

1. Ansible is known for its ease of use, thanks to a more flexible agentless approach, which requires no additional software to be installed on the targets being automated. By contrast, Chef takes an agent-based approach, meaning additional software is required on each machine. 

2. Another key distinction is that Ansible uses YAML, a Python-based configuration language that is easier to learn and oriented to administrators, whereas Chef uses Ruby, a Domain Specific Language (DSL) that is oriented to developers and has a steeper learning curve.

3. Ansible is an open-source IT automation tool, whereas Chef is a commercial automation tool.  

<h5>Ansible v/s Puppet</h5>

1. Management of Ansible vs. Puppet focuses on push and pull configurations. In Puppet, the client pulls configurations from the server, whereas in Ansible, the server pushes configurations to the nodes, for instantaneous deployment. Plus, in Puppet, you have to write the configurations in Puppet’s language, as mentioned, whereas in Ansible you use YAML, which is close to English.
2. As for scheduling, in the default settings, Puppet Agent checks every 30 minutes to make sure the nodes are in the desired state. The free version of Ansible doesn’t include that capability; you’d need to use the enterprise version, Ansible Tower, for that.
3. Overall, Ansible lacks some advanced features that Puppet and other more mature competitors have.
4. Ansible and Puppet take different approaches to the automation itself, with Ansible utilizing human-readable language for configuration files and procedural automation (defining steps to be run in order).
   
<h5>Programming Language used by Ansible</h5>

YAML

