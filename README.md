# personal-cloud-starter
A template to get you started with your own self-hosted cloud

This is a work in progress. Stay tuned for updates and much better documentation.

## Instructions (WIP)

1. Create your own private repo from this template
1. ssh into your server
1. Clone your repo and cd into the created directory
1. `cp .env-example .env`
1. `nano .env`
1. Update as desired and generate long passwords
1. `cp apps/ddns-updater/config-example.json apps/ddns-updater/config.json`
1. `nano apps/ddns-updater/config.json`
1. Update for your dynamic DNS provider and subdomains
1. `./scripts/init.sh`
