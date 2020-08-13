# Docker Compose + Traefik TLS Proxy + Self-signed Wildcard Cert

This is a template of the solution I've used in various forms for years for local development. It's easy, flexable, and gives me a near magical solution for always running HTTP apps through docker-compose with TLS, any DNS name, all on a single port with host-header SNI routing via Traefik proxy.

## Why would you want this?

- You want to use TLS locally in HTTP development
- You would like a single proxy app to all of your containers (microservices, etc.) on 80/443
- You'd like to use domain names for all your compose services, like https://api.bret.lol without touching /etc/hosts
- You'd like a trusted certificate in your browsers for local dev and test of any app hostname (api, www, blog, etc.)
- You'd like this to all happen consistanly across all your dev projects


Inspired by [this great Traefik + Compose walkthough](https://github.com/DoTheEvo/Traefik-v2-examples)


## Overall Steps to Implement

1. Decide on your URL scheme like `*.xip.io`, `*.localhost`, `*.vcap.me`, or even `*.bret.lol`
2. Create and install a self-signed wildcard cert for your browser with `cert.sh`
3. Add this `docker-compose.yaml` and `traefik.yaml` to your projects, and replace the nginx/httpd example compose services with your apps


## Decide on Your URL Scheme

TODO

## Create and Install a Self-Signed Wildcard Certificate

TODO

## Add Compose+Traefik YAML to Your Projects

TODO

This repository uses [The Unlicense](./LICENSE)