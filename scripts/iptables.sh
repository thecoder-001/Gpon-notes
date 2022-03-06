iptables -A INPUT_FW_LEVEL ! -i br+ -p tcp -m tcp --sport 80 -j ACCEPT
iptables -A INPUT_FW_LEVEL -p udp --sport 443 -j ACCEPT
iptables -A INPUT_FW_LEVEL -p tcp --sport 443 -j ACCEPT
ip6tables -A INPUT_FW_LEVEL ! -i br+ -p tcp -m tcp --sport 80 -j ACCEPT
ip6tables -A INPUT_FW_LEVEL -p udp --sport 443 -j ACCEPT
ip6tables -A INPUT_FW_LEVEL -p tcp --sport 443 -j ACCEPT
echo "applied rules"
