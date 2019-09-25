# Docker role

This role installs Docker in the target nodes.

> Current version installed: 1.12.6 (with DockerSelinux 1.12.6)

## Features

 * Online installation for RHEL 7.3 from official repositories.
 * Offline installation for RHEL 7.2. Packages are stored in the path `files/`
 * Packages that were installed with role docker-py in previuos versions of Iluvatar now there are installed from official repositories (for every version of RHEL)
 * Now Docker is configured using the jinja2 template `daemon.json.j2` stored in `'templates/`

## Configuration variables

Its behaviour could be modfied by changing the following variables. Only **docker_version** is mandatory, the rest of them are optional.

Variable | Description | Default
--- | --- | ---
**docker_version** | The version of docker that will be installed | ""
**docker_registry_url** | The URL of a Docker registry to configure as insecure | ""
**docker_authentication** | Dictionary that defines docker registries to authenticate.|{}

docker_authentication permits authentication on multiple registries. This variable should be defined in the environment descriptor. 

docker_authentication example:

```json
"docker_authentication": {
  "registry.example.com/repos": {
    "user": "pepe",
    "password": "1234"
  },
  "registry.example2.com/repos": {
    "user": "fulano",
    "password": "abcd"
  }
}
```

## How to use

```
- hosts:
    - host01
  become: yes
  become_user: root
  roles:
    - docker
```
