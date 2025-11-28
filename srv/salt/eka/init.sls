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
  pkg.uptodate:
    - refresh: True
