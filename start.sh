#!/bin/bash
export GODEBUG=netdns=cgo
confd -onetime -backend rancher
gosuv add --name "ngrok" -- /bin/ngrok start --all --config=/etc/ngrok.yml
confd -backend rancher -interval ${CONFD_INTERVAL:-15}
