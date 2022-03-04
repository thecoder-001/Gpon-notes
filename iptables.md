With http/https bocked:
```
[root@AONT: lifeboat]# iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
TCPMSS     tcp  --  anywhere             anywhere             tcp flags:SYN,RST/SYN TCPMSS set 1412
TCPMSS     tcp  --  anywhere             anywhere             tcp flags:SYN,RST/SYN TCPMSS set 1460
ACCEPT     all  --  anywhere             anywhere
INPUT_DOS_PROT  all  --  anywhere             anywhere
INPUT_INTERMAL_COMM  all  --  anywhere             anywhere
INPUT_LAN2WANITFIP_BLOCK  all  --  anywhere             anywhere
INPUT_PORTSCAN_BLACK  all  --  anywhere             anywhere
INPUT_RTP_BLOCK  all  --  anywhere             anywhere
INPUT_FW_PREFIX  all  --  anywhere             anywhere
INPUT_FW_BLACK  all  --  anywhere             anywhere
INPUT_FW_WHITE  all  --  anywhere             anywhere
INPUT_FW_DEFAULT  all  --  anywhere             anywhere

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
FORWARD_WANDHCP_DROP  udp  --  anywhere             anywhere             udp spt:bootps dpt:bootpc
TCPMSS     tcp  --  anywhere             anywhere             tcp flags:SYN,RST/SYN TCPMSS set 1412
FORWARD_FW_PREFIX  all  --  anywhere             anywhere
FORWARD_FW_BLACK  all  --  anywhere             anywhere
FORWARD_FW_WHITE  all  --  anywhere             anywhere
FORWARD_ALG  all  --  anywhere             anywhere
FORWARD_URL_FILTER  all  --  anywhere             anywhere
FORWARD_ACCESSPOLICY  all  --  anywhere             anywhere
FORWARD_FW_LEVEL  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
TCPMSS     tcp  --  anywhere             anywhere             tcp flags:SYN,RST/SYN TCPMSS set 1412
TCPMSS     tcp  --  anywhere             anywhere             tcp flags:SYN,RST/SYN TCPMSS set 1460
OUTPUT_INTERMAL_COMM  all  --  anywhere             anywhere

Chain ACK_LOG_AND_DROP (7 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere             limit: avg 3/min burst 3 LOG level debug tcp-sequence tcp-options ip-options prefix "ACK_DROP "
DROP       all  --  anywhere             anywhere

Chain ACK_LOG_AND_REJECT (7 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere             limit: avg 3/min burst 3 LOG level debug tcp-sequence tcp-options ip-options prefix "ACK_REJTCP "
REJECT     tcp  --  anywhere             anywhere             reject-with tcp-reset

Chain DOS_LOG_AND_DROP (23 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere             limit: avg 6/min burst 12 LOG level debug tcp-sequence tcp-options ip-options prefix "DOS_DROP "
DROP       all  --  anywhere             anywhere

Chain DOS_PROT_ICMP (1 references)
target     prot opt source               destination
DOS_LOG_AND_DROP  icmp --  anywhere             anywhere             #conn src/32 > 1000
RETURN     icmp --  anywhere             anywhere             limit: avg 1250/sec burst 1250
DOS_LOG_AND_DROP  icmp --  anywhere             anywhere

Chain DOS_PROT_TCP (1 references)
target     prot opt source               destination
RETURN     tcp  --  anywhere             anywhere             ctstate NEW limit: avg 1666/sec burst 2500
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             ctstate NEW
RETURN     tcp  --  anywhere             anywhere             ctstate INVALID limit: avg 500/sec burst 1500
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             ctstate INVALID

Chain DOS_PROT_UDP (1 references)
target     prot opt source               destination
RETURN     udp  --  anywhere             anywhere             limit: avg 1000/sec burst 1500
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere

Chain FORWARD_ACCESSPOLICY (1 references)
target     prot opt source               destination

Chain FORWARD_ALG (1 references)
target     prot opt source               destination
ACCEPT     udp  --  anywhere             anywhere             udp dpt:isakmp
ACCEPT     udp  --  anywhere             anywhere             udp dpt:4500
ACCEPT     udp  --  anywhere             anywhere             udp dpt:l2tp

Chain FORWARD_DMZ (1 references)
target     prot opt source               destination

Chain FORWARD_DROP_ACK (1 references)
target     prot opt source               destination
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW

Chain FORWARD_FWLEVEL_RULES (1 references)
target     prot opt source               destination

Chain FORWARD_FW_BLACK (1 references)
target     prot opt source               destination
IPFLTOUTFWD_BLACK  all  --  anywhere             anywhere
WANIPDROP  all  --  anywhere             anywhere

Chain FORWARD_FW_LEVEL (1 references)
target     prot opt source               destination
FORWARD_FWLEVEL_RULES  all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere

Chain FORWARD_FW_PREFIX (1 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
FORWARD_DROP_ACK  all  --  anywhere             anywhere

Chain FORWARD_FW_WHITE (1 references)
target     prot opt source               destination
FORWARD_PORTFWD  all  --  anywhere             anywhere
FORWARD_DMZ  all  --  anywhere             anywhere
IPFLTOUTFWD_WHITE  all  --  anywhere             anywhere

Chain FORWARD_PORTFWD (1 references)
target     prot opt source               destination
FORWARD_PORTFWD_EHEP  all  --  anywhere             anywhere
FORWARD_PORTFWD_EHWP  all  --  anywhere             anywhere
FORWARD_PORTFWD_WHEP  all  --  anywhere             anywhere
FORWARD_PORTFWD_WHWP  all  --  anywhere             anywhere

Chain FORWARD_PORTFWD_EHEP (1 references)
target     prot opt source               destination

Chain FORWARD_PORTFWD_EHWP (1 references)
target     prot opt source               destination

Chain FORWARD_PORTFWD_WHEP (1 references)
target     prot opt source               destination

Chain FORWARD_PORTFWD_WHWP (1 references)
target     prot opt source               destination

Chain FORWARD_URL_FILTER (1 references)
target     prot opt source               destination

Chain FORWARD_WANDHCP_DROP (1 references)
target     prot opt source               destination
DROP       udp  --  anywhere             anywhere             udp spt:bootps dpt:bootpc
DROP       udp  --  anywhere             anywhere             udp spt:bootps dpt:bootpc

Chain INPUT_DOS_PROT (1 references)
target     prot opt source               destination
LOG        tcp  --  anywhere             anywhere             tcp dpt:ftp limit: avg 3/min burst 10 LOG level alert prefix "wan-ftp-access-log"
SUB_DOS_PROT  all  --  anywhere             anywhere

Chain INPUT_DROP_ACK (1 references)
target     prot opt source               destination
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW

Chain INPUT_FW_BLACK (1 references)
target     prot opt source               destination
INPUT_WAN_TR069_UPGRADE  all  --  anywhere             anywhere
INPUT_LAN_ACCESS  all  --  anywhere             anywhere
IPFLTOUTFWD_BLACK  all  --  anywhere             anywhere
INPUT_WAN_REMOTE_ACCESS  all  --  anywhere             anywhere
INPUT_FW_LEVEL  all  --  anywhere             anywhere
WANIPDROP  all  --  anywhere             anywhere

Chain INPUT_FW_DEFAULT (1 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
DROP       all  --  anywhere             anywhere

Chain INPUT_FW_LEVEL (1 references)
target     prot opt source               destination
ACCEPT     gre  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     udp  --  anywhere             anywhere             udp spt:ntp
ACCEPT     icmp --  anywhere             anywhere             icmp echo-request limit: avg 10/sec burst 20
DROP       icmp --  anywhere             anywhere             icmp echo-request
REJECT     tcp  --  anywhere             anywhere             tcp dpt:ftp reject-with tcp-reset
ACCEPT     tcp  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere             tcp spt:ftp
ACCEPT     udp  --  anywhere             anywhere
ACCEPT     udp  --  anywhere             anywhere             udp dpt:49407
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:49407
REJECT     tcp  --  anywhere             anywhere             tcp dpt:5060 reject-with tcp-reset
ACCEPT     udp  --  anywhere             anywhere             udp dpts:5000:5100
ACCEPT     udp  --  anywhere             anywhere             udp dpt:5060
INPUT_FW_VOIP  all  --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere             tcp spt:8103
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:7547
ACCEPT     udp  --  anywhere             anywhere             udp spt:radius-acct
ACCEPT     udp  --  anywhere             anywhere             udp spt:radius
ACCEPT     udp  --  anywhere             anywhere             udp dpt:2944
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:2944
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:2122
ACCEPT     tcp  --  anywhere             anywhere             tcp dpts:49152:49163
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:7580
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:ipp
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:microsoft-ds
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:1990
ACCEPT     udp  --  anywhere             anywhere             udp dpt:49249
ACCEPT     udp  --  anywhere             anywhere             udp dpt:1900
ACCEPT     udp  --  anywhere             anywhere             udp dpt:320
ACCEPT     udp  --  anywhere             anywhere             udp dpt:319
ACCEPT     udp  --  anywhere             anywhere             udp dpt:58
ACCEPT     udp  --  anywhere             anywhere             udp dpt:domain
ACCEPT     udp  --  anywhere             anywhere             udp dpt:bootps
ACCEPT     udp  --  anywhere             anywhere             udp dpt:bootpc
ACCEPT     udp  --  anywhere             anywhere             udp spt:domain
REJECT     udp  --  anywhere             anywhere             udp dpt:domain reject-with icmp-port-unreachable
ACCEPT     igmp --  anywhere             base-address.mcast.net/4
ACCEPT     icmp --  anywhere             anywhere             icmp echo-reply
REJECT     tcp  --  anywhere             anywhere             tcp dpt:5916 reject-with tcp-reset

Chain INPUT_FW_PREFIX (1 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
INPUT_DROP_ACK  all  --  anywhere             anywhere

Chain INPUT_FW_VOIP (1 references)
target     prot opt source               destination
ACCEPT     udp  --  anywhere             anywhere             udp dpt:5060
ACCEPT     udp  --  anywhere             anywhere             udp dpt:5060
ACCEPT     udp  --  anywhere             anywhere             udp dpts:5000:5100

Chain INPUT_FW_WHITE (1 references)
target     prot opt source               destination
IPFLTOUTFWD_WHITE  all  --  anywhere             anywhere

Chain INPUT_INTERMAL_COMM (1 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere

Chain INPUT_LAN2WANITFIP_BLOCK (1 references)
target     prot opt source               destination
DROP       all  --  anywhere             100.86.71.151

Chain INPUT_LAN_ACCESS (1 references)
target     prot opt source               destination
ACCEPT     icmp --  anywhere             anywhere             icmp echo-request limit: avg 10/sec burst 20
DROP       icmp --  anywhere             anywhere             icmp echo-request
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:http
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:telnet
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:ssh
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:https

Chain INPUT_PORTSCAN_BLACK (1 references)
target     prot opt source               destination

Chain INPUT_RTP_BLOCK (1 references)
target     prot opt source               destination

Chain INPUT_WAN_ACCESS_TRUSTED (0 references)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere

Chain INPUT_WAN_REMOTE_ACCESS (1 references)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:https
ACCEPT     icmp --  anywhere             anywhere             icmp destination-unreachable
ACCEPT     icmp --  anywhere             anywhere             icmp time-exceeded
ACCEPT     icmp --  anywhere             anywhere             icmp address-mask-request
ACCEPT     icmp --  anywhere             anywhere             icmp address-mask-reply
ACCEPT     icmp --  anywhere             anywhere             icmp echo-request limit: avg 10/sec burst 20
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:http
RETURN     all  --  anywhere             anywhere
REJECT     tcp  --  anywhere             anywhere             tcp dpt:http ctstate INVALID,NEW,RELATED,ESTABLISHED reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp dpt:telnet ctstate INVALID,NEW,RELATED,ESTABLISHED reject-with icmp-port-unreachable
DROP       icmp --  anywhere             anywhere             icmp echo-request
REJECT     tcp  --  anywhere             anywhere             tcp dpt:ssh reject-with tcp-reset
REJECT     tcp  --  anywhere             anywhere             tcp dpt:7547 reject-with tcp-reset
REJECT     tcp  --  anywhere             anywhere             tcp spt:8103 reject-with tcp-reset
REJECT     tcp  --  anywhere             anywhere             tcp dpt:https ctstate INVALID,NEW,RELATED,ESTABLISHED reject-with icmp-port-unreachable

Chain INPUT_WAN_TR069_UPGRADE (1 references)
target     prot opt source               destination

Chain INPUT_WEB_MGR (0 references)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:http

Chain IPFLTOUTFWD_BLACK (2 references)
target     prot opt source               destination

Chain IPFLTOUTFWD_WHITE (2 references)
target     prot opt source               destination

Chain OUTPUT_FW_LEVEL (0 references)
target     prot opt source               destination

Chain OUTPUT_INTERMAL_COMM (1 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere

Chain OUTPUT_WAN_REMOTE_ACCESS (0 references)
target     prot opt source               destination

Chain SUB_DOS_PROT (1 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere
RETURN     all  --  anywhere             anywhere
DOS_LOG_AND_DROP !igmp --  0.0.0.0/8            anywhere
DOS_LOG_AND_DROP  all  --  127.0.0.0/8          anywhere
DOS_LOG_AND_DROP  all  --  255.0.0.0/8          anywhere
DOS_LOG_AND_DROP  all  --  192.168.1.0/24       anywhere
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:ftp
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:ssh
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:http
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:https
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:webcache
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:8090
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp dpt:netbios-ns flags:URG/URG
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp dpt:netbios-dgm flags:URG/URG
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp dpt:netbios-ssn flags:URG/URG
DOS_LOG_AND_DROP  icmp --  anywhere             anywhere             icmp redirect
RETURN     udp  --  anywhere             anywhere             udp dpt:domain limit: avg 100/sec burst 150
RETURN     udp  --  anywhere             anywhere             udp spt:domain limit: avg 200/sec burst 300
RETURN     tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/SYN limit: avg 20/sec burst 30
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/SYN
RETURN     icmp --  anywhere             anywhere             icmp echo-request limit: avg 20/sec burst 100
DOS_LOG_AND_DROP  icmp --  anywhere             anywhere             icmp echo-request
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/SYN #conn src/32 > 15
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/FIN #conn src/32 > 15
DOS_PROT_TCP  tcp  --  anywhere             anywhere
DOS_PROT_UDP  udp  --  anywhere             anywhere
DOS_PROT_ICMP  icmp --  anywhere             anywhere

Chain UrlFilter (0 references)
target     prot opt source               destination
QUEUE      tcp  --  anywhere             anywhere             tcp dpt:http

Chain WANIPALLOW (0 references)
target     prot opt source               destination

Chain WANIPDROP (2 references)
target     prot opt source               destination
[root@AONT: lifeboat]#

```
With https/http unblocked:
```
[root@AONT: lifeboat]# iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
TCPMSS     tcp  --  anywhere             anywhere             tcp flags:SYN,RST/SYN TCPMSS set 1460
ACCEPT     all  --  anywhere             anywhere
INPUT_DOS_PROT  all  --  anywhere             anywhere
INPUT_INTERMAL_COMM  all  --  anywhere             anywhere
INPUT_LAN2WANITFIP_BLOCK  all  --  anywhere             anywhere
INPUT_PORTSCAN_BLACK  all  --  anywhere             anywhere
INPUT_RTP_BLOCK  all  --  anywhere             anywhere
INPUT_FW_PREFIX  all  --  anywhere             anywhere
INPUT_FW_BLACK  all  --  anywhere             anywhere
INPUT_FW_WHITE  all  --  anywhere             anywhere
INPUT_FW_DEFAULT  all  --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:https ctstate NEW,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:https

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
FORWARD_WANDHCP_DROP  udp  --  anywhere             anywhere             udp spt:bootps dpt:bootpc
TCPMSS     tcp  --  anywhere             anywhere             tcp flags:SYN,RST/SYN TCPMSS set 1412
FORWARD_FW_PREFIX  all  --  anywhere             anywhere
FORWARD_FW_BLACK  all  --  anywhere             anywhere
FORWARD_FW_WHITE  all  --  anywhere             anywhere
FORWARD_ALG  all  --  anywhere             anywhere
FORWARD_URL_FILTER  all  --  anywhere             anywhere
FORWARD_ACCESSPOLICY  all  --  anywhere             anywhere
FORWARD_FW_LEVEL  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
TCPMSS     tcp  --  anywhere             anywhere             tcp flags:SYN,RST/SYN TCPMSS set 1460
OUTPUT_INTERMAL_COMM  all  --  anywhere             anywhere

Chain ACK_LOG_AND_DROP (7 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere             limit: avg 3/min burst 3 LOG level debug tcp-sequence tcp-options ip-options prefix "ACK_DROP "
DROP       all  --  anywhere             anywhere

Chain ACK_LOG_AND_REJECT (7 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere             limit: avg 3/min burst 3 LOG level debug tcp-sequence tcp-options ip-options prefix "ACK_REJTCP "
REJECT     tcp  --  anywhere             anywhere             reject-with tcp-reset

Chain DOS_LOG_AND_DROP (23 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere             limit: avg 6/min burst 12 LOG level debug tcp-sequence tcp-options ip-options prefix "DOS_DROP "
DROP       all  --  anywhere             anywhere

Chain DOS_PROT_ICMP (1 references)
target     prot opt source               destination
DOS_LOG_AND_DROP  icmp --  anywhere             anywhere             #conn src/32 > 1000
RETURN     icmp --  anywhere             anywhere             limit: avg 1250/sec burst 1250
DOS_LOG_AND_DROP  icmp --  anywhere             anywhere

Chain DOS_PROT_TCP (1 references)
target     prot opt source               destination
RETURN     tcp  --  anywhere             anywhere             ctstate NEW limit: avg 1666/sec burst 2500
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             ctstate NEW
RETURN     tcp  --  anywhere             anywhere             ctstate INVALID limit: avg 500/sec burst 1500
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             ctstate INVALID

Chain DOS_PROT_UDP (1 references)
target     prot opt source               destination
RETURN     udp  --  anywhere             anywhere             limit: avg 1000/sec burst 1500
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere

Chain FORWARD_ACCESSPOLICY (1 references)
target     prot opt source               destination

Chain FORWARD_ALG (1 references)
target     prot opt source               destination
ACCEPT     udp  --  anywhere             anywhere             udp dpt:isakmp
ACCEPT     udp  --  anywhere             anywhere             udp dpt:4500
ACCEPT     udp  --  anywhere             anywhere             udp dpt:l2tp

Chain FORWARD_DMZ (1 references)
target     prot opt source               destination

Chain FORWARD_DROP_ACK (1 references)
target     prot opt source               destination
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW

Chain FORWARD_FWLEVEL_RULES (1 references)
target     prot opt source               destination

Chain FORWARD_FW_BLACK (1 references)
target     prot opt source               destination
IPFLTOUTFWD_BLACK  all  --  anywhere             anywhere
WANIPDROP  all  --  anywhere             anywhere

Chain FORWARD_FW_LEVEL (1 references)
target     prot opt source               destination
FORWARD_FWLEVEL_RULES  all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere

Chain FORWARD_FW_PREFIX (1 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
FORWARD_DROP_ACK  all  --  anywhere             anywhere

Chain FORWARD_FW_WHITE (1 references)
target     prot opt source               destination
FORWARD_PORTFWD  all  --  anywhere             anywhere
FORWARD_DMZ  all  --  anywhere             anywhere
IPFLTOUTFWD_WHITE  all  --  anywhere             anywhere

Chain FORWARD_PORTFWD (1 references)
target     prot opt source               destination
FORWARD_PORTFWD_EHEP  all  --  anywhere             anywhere
FORWARD_PORTFWD_EHWP  all  --  anywhere             anywhere
FORWARD_PORTFWD_WHEP  all  --  anywhere             anywhere
FORWARD_PORTFWD_WHWP  all  --  anywhere             anywhere

Chain FORWARD_PORTFWD_EHEP (1 references)
target     prot opt source               destination

Chain FORWARD_PORTFWD_EHWP (1 references)
target     prot opt source               destination

Chain FORWARD_PORTFWD_WHEP (1 references)
target     prot opt source               destination

Chain FORWARD_PORTFWD_WHWP (1 references)
target     prot opt source               destination

Chain FORWARD_URL_FILTER (1 references)
target     prot opt source               destination

Chain FORWARD_WANDHCP_DROP (1 references)
target     prot opt source               destination
DROP       udp  --  anywhere             anywhere             udp spt:bootps dpt:bootpc
DROP       udp  --  anywhere             anywhere             udp spt:bootps dpt:bootpc

Chain INPUT_DOS_PROT (1 references)
target     prot opt source               destination
LOG        tcp  --  anywhere             anywhere             tcp dpt:ftp limit: avg 3/min burst 10 LOG level alert prefix "wan-ftp-access-log"
SUB_DOS_PROT  all  --  anywhere             anywhere

Chain INPUT_DROP_ACK (1 references)
target     prot opt source               destination
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_DROP  all  --  anywhere             anywhere             ctstate INVALID
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW
ACK_LOG_AND_REJECT  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/ACK ctstate NEW

Chain INPUT_FW_BLACK (1 references)
target     prot opt source               destination
INPUT_WAN_TR069_UPGRADE  all  --  anywhere             anywhere
INPUT_LAN_ACCESS  all  --  anywhere             anywhere
IPFLTOUTFWD_BLACK  all  --  anywhere             anywhere
INPUT_WAN_REMOTE_ACCESS  all  --  anywhere             anywhere
INPUT_FW_LEVEL  all  --  anywhere             anywhere
WANIPDROP  all  --  anywhere             anywhere

Chain INPUT_FW_DEFAULT (1 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
DROP       all  --  anywhere             anywhere

Chain INPUT_FW_LEVEL (1 references)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere             tcp spt:7070
ACCEPT     tcp  --  anywhere             anywhere             tcp spt:3495
ACCEPT     tcp  --  anywhere             anywhere             tcp spt:http
ACCEPT     gre  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     udp  --  anywhere             anywhere             udp spt:ntp
ACCEPT     icmp --  anywhere             anywhere             icmp echo-request limit: avg 10/sec burst 20
DROP       icmp --  anywhere             anywhere             icmp echo-request
REJECT     tcp  --  anywhere             anywhere             tcp dpt:ftp reject-with tcp-reset
ACCEPT     tcp  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere             tcp spt:ftp
ACCEPT     udp  --  anywhere             anywhere
ACCEPT     udp  --  anywhere             anywhere             udp dpt:49407
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:49407
REJECT     tcp  --  anywhere             anywhere             tcp dpt:5060 reject-with tcp-reset
ACCEPT     udp  --  anywhere             anywhere             udp dpts:5000:5100
ACCEPT     udp  --  anywhere             anywhere             udp dpt:5060
INPUT_FW_VOIP  all  --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere             tcp spt:8103
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:7547
ACCEPT     udp  --  anywhere             anywhere             udp spt:radius-acct
ACCEPT     udp  --  anywhere             anywhere             udp spt:radius
ACCEPT     udp  --  anywhere             anywhere             udp dpt:2944
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:2944
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:2122
ACCEPT     tcp  --  anywhere             anywhere             tcp dpts:49152:49163
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:7580
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:ipp
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:microsoft-ds
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:1990
ACCEPT     udp  --  anywhere             anywhere             udp dpt:49249
ACCEPT     udp  --  anywhere             anywhere             udp dpt:1900
ACCEPT     udp  --  anywhere             anywhere             udp dpt:320
ACCEPT     udp  --  anywhere             anywhere             udp dpt:319
ACCEPT     udp  --  anywhere             anywhere             udp dpt:58
ACCEPT     udp  --  anywhere             anywhere             udp dpt:domain
ACCEPT     udp  --  anywhere             anywhere             udp dpt:bootps
ACCEPT     udp  --  anywhere             anywhere             udp dpt:bootpc
ACCEPT     udp  --  anywhere             anywhere             udp spt:domain
REJECT     udp  --  anywhere             anywhere             udp dpt:domain reject-with icmp-port-unreachable
ACCEPT     igmp --  anywhere             224.0.0.0/4
ACCEPT     icmp --  anywhere             anywhere             icmp echo-reply
REJECT     tcp  --  anywhere             anywhere             tcp dpt:5916 reject-with tcp-reset
ACCEPT     udp  --  anywhere             anywhere             udp spt:https
ACCEPT     tcp  --  anywhere             anywhere             tcp spt:https

Chain INPUT_FW_PREFIX (1 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
INPUT_DROP_ACK  all  --  anywhere             anywhere

Chain INPUT_FW_VOIP (1 references)
target     prot opt source               destination
ACCEPT     udp  --  anywhere             anywhere             udp dpt:5060
ACCEPT     udp  --  anywhere             anywhere             udp dpt:5060
ACCEPT     udp  --  anywhere             anywhere             udp dpts:5000:5100

Chain INPUT_FW_WHITE (1 references)
target     prot opt source               destination
IPFLTOUTFWD_WHITE  all  --  anywhere             anywhere

Chain INPUT_INTERMAL_COMM (1 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere

Chain INPUT_LAN2WANITFIP_BLOCK (1 references)
target     prot opt source               destination

Chain INPUT_LAN_ACCESS (1 references)
target     prot opt source               destination
ACCEPT     icmp --  anywhere             anywhere             icmp echo-request limit: avg 10/sec burst 20
DROP       icmp --  anywhere             anywhere             icmp echo-request
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:http
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:telnet
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:ssh
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:https

Chain INPUT_PORTSCAN_BLACK (1 references)
target     prot opt source               destination

Chain INPUT_RTP_BLOCK (1 references)
target     prot opt source               destination

Chain INPUT_WAN_ACCESS_TRUSTED (0 references)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere

Chain INPUT_WAN_REMOTE_ACCESS (1 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere
REJECT     tcp  --  anywhere             anywhere             tcp dpt:http ctstate INVALID,NEW,RELATED,ESTABLISHED reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp dpt:telnet ctstate INVALID,NEW,RELATED,ESTABLISHED reject-with icmp-port-unreachable
DROP       icmp --  anywhere             anywhere             icmp echo-request
REJECT     tcp  --  anywhere             anywhere             tcp dpt:ssh reject-with tcp-reset
REJECT     tcp  --  anywhere             anywhere             tcp dpt:7547 reject-with tcp-reset
REJECT     tcp  --  anywhere             anywhere             tcp spt:8103 reject-with tcp-reset
REJECT     tcp  --  anywhere             anywhere             tcp dpt:https ctstate INVALID,NEW,RELATED,ESTABLISHED reject-with icmp-port-unreachable

Chain INPUT_WAN_TR069_UPGRADE (1 references)
target     prot opt source               destination

Chain INPUT_WEB_MGR (0 references)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:http

Chain IPFLTOUTFWD_BLACK (2 references)
target     prot opt source               destination

Chain IPFLTOUTFWD_WHITE (2 references)
target     prot opt source               destination

Chain OUTPUT_FW_LEVEL (0 references)
target     prot opt source               destination

Chain OUTPUT_INTERMAL_COMM (1 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere

Chain OUTPUT_WAN_REMOTE_ACCESS (0 references)
target     prot opt source               destination

Chain SUB_DOS_PROT (1 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere
RETURN     all  --  anywhere             anywhere
DOS_LOG_AND_DROP !igmp --  0.0.0.0/8            anywhere
DOS_LOG_AND_DROP  all  --  127.0.0.0/8          anywhere
DOS_LOG_AND_DROP  all  --  255.0.0.0/8          anywhere
DOS_LOG_AND_DROP  all  --  192.168.1.0/24       anywhere
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:ftp
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:ssh
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:http
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:https
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:webcache
DOS_LOG_AND_DROP  udp  --  anywhere             anywhere             udp dpt:8090
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp dpt:netbios-ns flags:URG/URG
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp dpt:netbios-dgm flags:URG/URG
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp dpt:netbios-ssn flags:URG/URG
DOS_LOG_AND_DROP  icmp --  anywhere             anywhere             icmp redirect
RETURN     udp  --  anywhere             anywhere             udp dpt:domain limit: avg 100/sec burst 150
RETURN     udp  --  anywhere             anywhere             udp spt:domain limit: avg 200/sec burst 300
RETURN     tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/SYN limit: avg 20/sec burst 30
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/SYN
RETURN     icmp --  anywhere             anywhere             icmp echo-request limit: avg 20/sec burst 100
DOS_LOG_AND_DROP  icmp --  anywhere             anywhere             icmp echo-request
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/SYN #conn src/32 > 15
DOS_LOG_AND_DROP  tcp  --  anywhere             anywhere             tcp flags:FIN,SYN,RST,ACK/FIN #conn src/32 > 15
DOS_PROT_TCP  tcp  --  anywhere             anywhere
DOS_PROT_UDP  udp  --  anywhere             anywhere
DOS_PROT_ICMP  icmp --  anywhere             anywhere

Chain UrlFilter (0 references)
target     prot opt source               destination
QUEUE      tcp  --  anywhere             anywhere             tcp dpt:http

Chain WANIPALLOW (0 references)
target     prot opt source               destination

Chain WANIPDROP (2 references)
target     prot opt source               destination
[root@AONT: lifeboat]#
```
How to allow firewall:
```bash
$ iptables -A INPUT_FW_LEVEL ! -i br+ -p tcp -m tcp --sport 80 -j ACCEPT

$ iptables -A INPUT_FW_LEVEL -p udp --sport 443 -j ACCEPT

$ iptables -A INPUT_FW_LEVEL -p tcp --sport 443 -j ACCEPT
```
