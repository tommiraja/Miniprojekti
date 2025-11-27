openssh-server: 
  pkg.installed: []

ssh-service:
  service.running:
    - name: ssh
    - enable: True
    - require:
      - pkg: openssh-server
