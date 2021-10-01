# personal-cloud-starter
Many of the internet services we rely on every day exist solely to use your data to try to target you more accurately for advertising purposes. Luckily, there are a plethora of open-source tools that allow you to host your own similar services and reduce your reliance on untrustworthy corporations. This repository is aimed at those who are new to self-hosting who want to spin up their own person cloud without needing to spend weeks researching all the different ways to accomplish this task.

This is a work in progress. Stay tuned for updates and much better documentation.

## Apps
1. [Nextcloud](https://nextcloud.com/) is a great platform to cover a lot of your needs with a single application. Nextcloud's main function is to store and share files like Dropbox, Google Drive, or one of the million other file hosting websites available. But Nextcloud also has the ability to install apps to extend its functionality. Apps like Notes, Contacts, and Calendar will have you de-Googling in no time.
1. [Bitwarden]() (or the [Valutwarden]() fork) is a fantastic password manager with features like organizations to share passwords with others, secure file and secret sharing, and tools to help you mitigate damage from data breaches. Get all the paid features by hosting yourself.
1. [Miniflux]() is a minimal RSS reader and aggregator. Get your news straight from the websites you trust without relying on an algorithmic news feed to show you what it thinks you want to see.

## Backgroup Applications
1. [MariaDB]()
1. [PostgreSQL]()
1. [Caddy]()
1. [DDNS-Updater]()
1. [Duplicati]()

## Prerequisites

1. A server running [Ubuntu Server 20.04](https://ubuntu.com/download/server). You can use an old computer, buy something second-hand from a business or individual, or a cheap cloud VPS (you can support development by signing up for UpCloud with using this [referral link](https://upcloud.com/signup/?promo=59983M)) for example.
1. SSH access to your server. [Here](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04) is a nice guide to set up access using a key instead of a password.
1. (Optional) A domain name or dynamic DNS account to access your services with with nice URLs.

## Instructions (WIP)

1. Start by selecting the `Use this template` button on [Github](https://github.com/jhotmann/personal-cloud-starter). Give the repository a name and make it private so only you can see your files.
1. ssh into your server
1. Clone your repo and cd into the created directory
1. `cp .env-example .env`
1. `nano .env`
1. Update as desired and generate long passwords
1. `cp apps/ddns-updater/config-example.json apps/ddns-updater/config.json`
1. `nano apps/ddns-updater/config.json`
1. Update for your dynamic DNS provider and subdomains
1. `./scripts/init.sh`
