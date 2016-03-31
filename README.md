```
consul-cli --consul="172.20.4.21:8500" --token= kv  delete ngrok/tunnels  --recurse
consul-cli --consul="172.20.4.21:8500" --token= kv  write ngrok/tunnels/imim/proto http 
consul-cli --consul="172.20.4.21:8500" --token= kv  write ngrok/tunnels/imim/subdomain imimfimim
consul-cli --consul="172.20.4.21:8500" --token= kv  write ngrok/tunnels/imim/addr 172.20.4.8:80
consul-cli --consul="172.20.4.21:8500" --token= kv  write ngrok/tunnels/imim/host_header www.imim.es
consul-cli --consul="172.20.4.21:8500" --token= kv  write ngrok/tunnels/intranet/proto http 
consul-cli --consul="172.20.4.21:8500" --token= kv  write ngrok/tunnels/intranet/subdomain intranetfimim 
consul-cli --consul="172.20.4.21:8500" --token= kv  write ngrok/tunnels/intranet/addr intranet.imim.cat:8080
consul-cli --consul="172.20.4.21:8500" --token= kv  write ngrok/tunnels/intranet/host_header intranet.imim.cat
#consul-template --consul="172.20.4.21:8500" --token=3B1EB05F-F87F-4FE6-A13C-4202BEC55C01 -once -template consul.tmpl -dry
```


```
ngrok:
  external_links:
    - testconsul/consul:consul
  environment:
    - NGROK_AUTHTOKEN=
    - CONSUL_URL=consul:8500
    - CONSUL_TOKEN=
  labels:
    io.rancher.container.pull_image: always
  image: jmcarbo/rancher-ngrok
rancherui:
  image: rancher/external-service
```
