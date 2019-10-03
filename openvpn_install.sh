cd /tmp/EasyRSA-v3.0.6-CA \
	&& ./easyrsa init-pki \
	&& ./easyrsa build-ca nopass \
	&& cd /tmp/EasyRSA-v3.0.6-vpn \
	&& ./easyrsa init-pki \
	&& ./easyrsa gen-req server nopass \
	&& cp pki/private/server.key /etc/openvpn/ \
	&& cp pki/reqs/server.req /tmp/EasyRSA-v3.0.6-CA \
	&& cd /tmp/EasyRSA-v3.0.6-CA \
	&& ./easyrsa import-req server.req server \
	&& ./easyrsa sign-req server server \
	&& cp pki/issued/server.crt /etc/openvpn/ \
	&& cp pki/ca.crt /etc/openvpn/ \
	&& cd /tmp/EasyRSA-v3.0.6-vpn \
	&& ./easyrsa gen-dh \
	&& openvpn --genkey --secret ta.key \
	&& cp ta.key /etc/openvpn/ \
	&& cp pki/dh.pem /etc/openvpn/ \
	&& mkdir -p /tmp/client-configs/keys \
	&& chmod -R 700 /tmp/client-configs \
	&& ./easyrsa gen-req client1 nopass \
	&& cp pki/private/client1.key /tmp/client-configs/keys/ \
	&& cp pki/reqs/client1.req /tmp/EasyRSA-v3.0.6-CA \
	&& cd /tmp/EasyRSA-v3.0.6-CA \
	&& ./easyrsa import-req /tmp/EasyRSA-v3.0.6-CA/client1.req client1 \
	&& ./easyrsa sign-req client client1 \
	&& cp pki/issued/client1.crt /tmp/client-configs/keys/ \
	&& cd /tmp/EasyRSA-v3.0.6-vpn \
	&& cp ta.key /tmp/client-configs/keys/ \
	&& cp /etc/openvpn/ca.crt /tmp/client-configs/keys/ \
	&& cd /tmp

