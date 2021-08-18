# Custom hosts file installation script
Block ads and bad stuff using `hosts` file.

Domain list: https://github.com/StevenBlack/hosts + my additional domains

### Why
I created this script for automation (I often install / testing Linux distributions and playing with virtual machines).

### Dependencies
You need: `curl` and `bash` (Alpine, FreeBSD)

### Installation
```bash
$ git clone https://github.com/mich4ld/hosts
$ cd hosts
$ chmod +x ./install.sh
$ sudo ./install.sh
```
Read script before you execute it
```bash
$ less ./install.sh
```
Tested with:
- Arch
- Alpine
- Manjaro
- Mint
- Fedora
- FreeBSD


### Usage
```
$ sudo ./install.sh

What do you want to block?
1) Ads
2) Ads and gambling
3) Ads, gambling and porn
```

or

```
$ sudo ./install.sh 3
```
