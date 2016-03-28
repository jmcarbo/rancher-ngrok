#!/bin/bash
export GODEBUG=netdns=cgo
confd -backend rancher -interval ${CONFD_INTERVAL:-15}
