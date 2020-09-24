#cloud-config
package_upgrade: true

write_files:
  - path: /var/www/html/index.html
    owner: ec2-user:ec2-user
    permissions: '0666'
    content: |
      ok

runcmd:
  - [ "yum", "-y", "install", "httpd" ]
  - [ "service", "httpd", "start" ]
