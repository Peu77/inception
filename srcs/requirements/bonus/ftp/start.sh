#!/bin/sh

if ! id ${FTP_USER} >/dev/null 2>&1; then
    adduser -D ${FTP_USER}
    echo "${FTP_USER}:${FTP_PASS}" | chpasswd
fi

chown -R ${FTP_USER}:${FTP_USER} /var/ftp/wordpress

sed -i "s/\${PASV_ADDRESS}/${PASV_ADDRESS}/g" /etc/vsftpd/vsftpd.conf

mkdir -p /var/run/vsftpd/empty

exec vsftpd /etc/vsftpd/vsftpd.conf