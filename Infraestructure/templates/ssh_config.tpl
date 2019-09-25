Host * !${jump_fip}
User centos
IdentityFile ${jump_key}
ServerAliveInterval 60
TCPKeepAlive yes
ProxyCommand ssh -i ${jump_key} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -W %h:%p centos@${jump_fip}
LogLevel QUIET
StrictHostKeyChecking no
UserKnownHostsFile /dev/null

Host ${jump_fip}
Hostname ${jump_fip}
User centos
Port 22
IdentityFile ${jump_key}
PasswordAuthentication no
ForwardAgent yes
ServerAliveInterval 60
TCPKeepAlive yes
ControlMaster auto
ControlPersist 15m
ProxyCommand none
LogLevel QUIET
StrictHostKeyChecking no
UserKnownHostsFile /dev/null
