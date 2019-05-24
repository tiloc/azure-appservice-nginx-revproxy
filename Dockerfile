FROM nginx:latest

# Install openssh-server to provide web ssh access from kudu, supervisor to run processor
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    supervisor \
    openssh-server \
    && echo "$SSH_PASSWD" | chpasswd	

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf	
COPY sshd_config /etc/ssh/
COPY init_container.sh /bin/
COPY hostingstart.html /var/www/html/hostingstart.html

RUN chmod u+x /bin/init_container.sh

EXPOSE 80 2222
CMD ["/bin/init_container.sh"]