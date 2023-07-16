FROM harbor.kengdie.xyz/k8s/library/ubuntu:22.04

COPY sources.list /etc/apt/sources.list
COPY init_code.py /init_code.py
COPY start_code.sh /start_code.sh

RUN apt update && \
	apt install -y mysql-client redis-tools net-tools iputils-ping iproute2 openssh-server curl vim wget git python3 python3-pip && \
	python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && \
	pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
	wget https://npmmirror.com/mirrors/node/v18.16.0/node-v18.16.0-linux-x64.tar.xz -O /tmp/node-v18.16.0-linux-x64.tar.xz && \
	tar xvf /tmp/node-v18.16.0-linux-x64.tar.xz -C /usr/local/ && \
	export PATH=$PATH:/usr/local/node-v18.16.0-linux-x64/bin/ && \
	echo "export PATH=$PATH:/usr/local/node-v18.16.0-linux-x64/bin/" >> ~/.bashrc && \
	npm set registry https://registry.npm.taobao.org && \
	npm install -g pnpm && \
	pnpm set registry https://registry.npm.taobao.org && \
	apt clean && \
	rm -rf /tmp/* && \
	mkdir /run/sshd && \
	sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -i "s/#UseDNS.*/UseDNS no/g" /etc/ssh/sshd_config
	
WORKDIR /code
EXPOSE 22
CMD ["/bin/bash", "/start_code.sh"]

