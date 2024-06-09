[webservers]
%{ for i in range(length(webservers)) ~}
web-${i + 1} ansible_host=${webservers[i].network_interface.0.nat_ip_address} fqdn=${webservers[i].fqdn}
%{ endfor ~}

[databases]
%{ for name, server in databases ~}
${name} ansible_host=${server.network_interface.0.nat_ip_address} fqdn=${server.fqdn}
%{ endfor ~}

[storage]
storage ansible_host=${storage.network_interface.0.nat_ip_address} fqdn=${storage.fqdn}