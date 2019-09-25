#!/bin/bash
echo "
#---------------------------------------------------------------------
#  DSHUB Configuración
#---------------------------------------------------------------------

frontend dshub
    bind *:80
    bind *:443

    acl host_dshub hdr(host) -i dshub.eva.eva-tech.com

    use_backend dshub_cluster if host_dshub

backend dshub_cluster
    balance leastconn
    option httpclose
    option forwardfor
    cookie JSESSIONID prefix
    server public-agent1 public-agent1.work.eva.local:10151 cookie A check
    server public-agent2 public-agent2.work.eva.local:10151 cookie A check
    server public-agent3 public-agent3.work.eva.local:10151 cookie A check
"
