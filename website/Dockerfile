FROM blueriver/nextjs

# Instala SSH
RUN apk update && \
    apk add --no-cache openssh && \
    ssh-keygen -A && \
    mkdir -p /var/run/sshd && \
    echo 'root:holamundo2024' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo 'ListenAddress 0.0.0.0' >> /etc/ssh/sshd_config

RUN apk add git

# Crear un nuevo usuario SSH
RUN adduser -D -g "users" jotal8 && \
    passwd -d jotal8 && \
    echo 'jotal8:holamundo' | chpasswd && \
    chown -R jotal8:users /app


CMD ["/usr/sbin/sshd", "-D"]

EXPOSE 22
EXPOSE 3000