FROM alpine:edge
MAINTAINER nk10025
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --update --no-cache add x11vnc xvfb openbox xfce4-terminal openrc dbus udev ttf-freefont firefox-esr supervisor sudo \
&& addgroup alpine \
&& adduser  -G alpine -s /bin/sh -D alpine \
&& echo "alpine:alpine" | /usr/sbin/chpasswd \
&& echo "alpine    ALL=(ALL) ALL" >> /etc/sudoers \
&& rm -rf /tmp/* /var/cache/apk/*
ADD etc /etc
WORKDIR /home/alpine
EXPOSE 5900
USER alpine
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
CMD ["/bin/sh","-c", "ff-fix.sh"]
