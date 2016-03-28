#!/bin/bash
export GODEBUG=netdns=cgo
confd -onetime -backend rancher
goforever -conf=/etc/goforever.toml start
confd -backend rancher -interval ${CONFD_INTERVAL:-15}
