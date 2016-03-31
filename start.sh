#!/bin/bash
export GODEBUG=netdns=cgo
echo "" >/etc/consul.yml
gosuv add --name "ngrok" -- /bin/ngrok start --all --config=/etc/ngrok.yml --config=/etc/consul.yml
if [ -n ${CONSUL_URL+1} ]; 
then
  gosuv add --name "consul-template" -- /bin/consul-templates --consul="$CONSUL_URL" --token="$CONSUL_TOKEN" -template "/etc/confd/templates/consul.yml.tmpl:/etc/consul.yml" 
fi

confd -onetime -backend rancher

gosuv stop ngrok && gosuv start ngrok
confd -backend rancher -interval ${CONFD_INTERVAL:-15}
