
FROM hub.c.163.com/netease_comb/centos:7
MAINTAINER netease
 
# 更新yum源
RUN yum makecache fast && yum -y update glibc  
# RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget npm apache2 php php-curl php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring  php-xml php-pear php-bcmath  -y
RUN yum install -y openssh-server ssh wget
RUN wget https://nodejs.org/dist/v12.18.1/node-v12.18.1-linux-x64.tar.xz
RUN tar -xvf node-v12.18.1-linux-x64.tar.xz
RUN pwd
RUN ln -s /node-v12.18.1-linux-x64/bin/node /usr/bin/node
RUN ln -s /node-v12.18.1-linux-x64/bin/npm /usr/bin/npm
RUN node -v
# RUN curl https://rpm.nodesource.com/setup_10.x -k -o setup_10.x
# RUN bash setup_10.x
# RUN yum clean all
# RUN yum -y install nodejs
# RUN cat /etc/httpd/conf.modules.d/00-base.conf
RUN npm install -g wstunnel
RUN npm bin -g
# RUN mkdir /run/sshd
RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -ivh epel-release-latest-7.noarch.rpm
RUN yum -y install nginx && nginx -v
RUN yum install -y nginx-mod-stream
RUN ls -al /etc/nginx/
RUN cat /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
# RUN echo 'You can play the awesome Cloud NOW! - Message from Uncle LUO!' >/var/www/html/index.html
ENV PATH /node-v12.18.1-linux-x64/bin:$PATH
# RUN echo 'service mysql restart' >>/luo.sh
# RUN echo 'service apache2 restart' >>/luo.sh
RUN ssh-keygen -A 
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo root:pp123|chpasswd
COPY ./start.sh /start.sh
RUN chmod 755 /start.sh
EXPOSE 80
CMD /start.sh
