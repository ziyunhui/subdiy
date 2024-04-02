mixed-port: 7890
allow-lan: true
mode: rule
log-level: info
ipv6: false
external-controller: 0.0.0.0:9090
dns:
  enable: true
  listen: 0.0.0.0:53
  ipv6: false
{% if default(request.clash.dns, "") == "china-doh" %}
  default-server:
    - 223.5.5.5
    - 119.29.29.29
  nameserver:
    - https://dns.alidns.com/dns-query
    - https://doh.pub/dns-query
{% else if default(request.clash.dns, "") == "self-doh" %}
  default-server:
    - 223.5.5.5
    - 119.29.29.29
  nameserver:
    - https://agh.lililili.net/1437bb45-7db3-4878-b836-091161dc37d7
{% else if default(request.clash.dns, "") == "google-doh" %}
  default-server:
    - 8.8.8.8
    - 8.8.4.4
  nameserver:
    - https://dns.google/dns-query
{% else if default(request.clash.dns, "") == "cloudflare-doh" %}
  default-server:
    - 1.1.1.1
    - 1.0.0.1
  nameserver:
    - https://cloudflare-dns.com/dns-query
{% else %}
  nameserver:
    - 223.5.5.5
    - 119.29.29.29
{% endif %}
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16
  fake-ip-filter:
    - +.msftncsi.com
    - +.msftconnecttest.com
    - msftconnecttest.com
    - localhost.ptlogin2.qq.com
