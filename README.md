# personal-cloud-starter
An opinionated [Docker Compose](https://docs.docker.com/compose/) template to get a self-hosted server up and running quick.

Many of the internet services we rely on every day exist solely to use your data to try to target you more accurately for advertising purposes. Luckily, there are a plethora of open-source tools that allow you to host your own similar services and reduce your reliance on untrustworthy corporations. This repository is aimed at those who are new to self-hosting who want to spin up their own person cloud without needing to spend weeks researching all the different ways to accomplish this task.

## Apps
1. [Nextcloud](https://nextcloud.com/) is a great platform to cover a lot of your needs with a single application. Nextcloud's main function is to store and share files like Dropbox, Google Drive, or one of the million other file hosting websites available. But Nextcloud also has the ability to install apps to extend its functionality. Apps like Notes, Contacts, and Calendar will have you de-Googling in no time.
1. [Bitwarden](https://bitwarden.com/) (via the [Valutwarden](https://github.com/dani-garcia/vaultwarden) fork) is a fantastic, open source password manager with features like organizations to share passwords with others, secure file and secret sharing, and tools to help you mitigate damage from data breaches. Get all the paid features by hosting yourself.
1. [Miniflux](https://miniflux.app/) is a minimal RSS reader and aggregator. Get your news straight from the websites you trust without relying on an algorithmic news feed to show you what it thinks you want to see.

## Background Applications
1. [MariaDB](https://mariadb.org/) is an open source SQL database supported by many applications
1. [PostgreSQL](https://www.postgresql.org/) is another great open source SQL database. Most applications should support Maria, Postgres, or both.
1. [Caddy](https://caddyserver.com/v2) via [Caddy-Docker-Proxy](https://github.com/lucaslorentz/caddy-docker-proxy) is a web server and [reverse proxy]() that we will use to point requests from mysubdomain.example.com to the correct container and port. Caddy automatically gets and renews TLS certificates so you can use HTTPS.
1. [DDNS-Updater](https://github.com/qdm12/ddns-updater) is a handy tool to automate dynamic DNS updates. This is especially important if you are running a home server and your IP address isn't static.
1. [Duplicati](https://www.duplicati.com/) is backup software that supports many cloud providers and automatically encrypts your data.

## Prerequisites

1. A server running [Ubuntu Server 20.04](https://ubuntu.com/download/server). You can use an old computer, buy something second-hand from a business or individual, or a cheap cloud VPS (you can support development by signing up for UpCloud with using this [referral link](https://upcloud.com/signup/?promo=59983M)).
1. SSH access to your server. [Here](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04) is a nice guide to set up access using a key instead of a password.
1. (Optional but recommended) A domain name and/or dynamic DNS account to access your services with with nice URLs.

## Quick Start

1. Select the `Use this template` button on [Github](https://github.com/jhotmann/personal-cloud-starter).
    - Give the repository a name
    - Make the repository private so only you can see your files
1. Clone the repo to your local machine

    `git clone https://github.com/{username}/{reponame}.git`

1. Copy `apps/ddns-updater/config-example.json` to `apps/ddns-updater/config.json` and configure your subdomains (documentation [here](https://github.com/qdm12/ddns-updater#configuration))
1. Push your changes back to GitHub

    ```sh
    git add .
    git commit -m "configure dynamic dns"
    git push -u origin main
    ```

1. ssh into your server
1. Clone your repo and cd into the created directory
1. Copy `.env-example` to `.env` and edit accordingly

    ```sh
    cp .env-example .env
    nano .env
    ```

1. Edit `scripts/backup.sh` and update the path to your repository on the server and the backup path if necessary
1. Run the init script to install the dependencies and launch the containers

    `./scripts/init.sh`

## Further Reading
Documentation is a work in progress, stay tuned for more documentation that will aim to explain every piece of the stack so that even a beginner can understand what's going on behind the scenes.
