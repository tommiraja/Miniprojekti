python_tools:
  pkg.installed:
    - pkgs:
      - python3
      - wget
      - curl
      - git
      - vim
      - python3-pip

update-system:
  cmd.run:
    - name: apt-get update && apt-get -y upgrade
    - unless: test -f /var/lib/apt/periodic/update-success-stamp
