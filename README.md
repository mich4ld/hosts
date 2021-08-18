# Custom hosts file installation script
Block ads and bad stuff using `hosts` file.

Domain list: https://github.com/StevenBlack/hosts + my additional domains

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
