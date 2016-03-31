#!/bin/bash
export GODEBUG=netdns=cgo
echo "" >/etc/consul.yml
gosuv add --name "ngrok" -- /bin/ngrok start --all --config=/etc/ngrok.yml --config=/etc/consul.yml
confd -onetime -backend rancher
gosuv stop ngrok && gosuv start ngrok
confd -backend rancher -interval ${CONFD_INTERVAL:-15}
