Examples
========

This directory contains example scripts demonstrating Bastille bootstrap features.

Scripts
-------

list-releases.sh
    List available releases. Pass an optional OS type argument to filter.

    Usage:
        ./list-releases.sh              # List all
        ./list-releases.sh ubuntu       # List Ubuntu only
        ./list-releases.sh freebsd      # List FreeBSD only

bootstrap-all-latest.sh
    Bootstrap a common set of releases for testing (FreeBSD, Ubuntu, Debian).

    Usage:
        ./bootstrap-all-latest.sh

bootstrap-ubuntu-latest.sh
    Discover and bootstrap the latest Ubuntu LTS release.

    Usage:
        ./bootstrap-ubuntu-latest.sh

bootstrap-freebsd-latest.sh
    Discover and bootstrap the latest FreeBSD RELEASE.

    Usage:
        ./bootstrap-freebsd-latest.sh

Quick Start Examples
-------------------

1. Discover what releases are available:

    bastille bootstrap --list

2. Bootstrap a FreeBSD jail:

    bastille bootstrap 15.0-RELEASE
    bastille create myjail 15.0-RELEASE 10.1.1.2

3. Bootstrap an Ubuntu jail:

    bastille bootstrap jammy
    bastille create -L myjail jammy 10.1.1.3

4. Bootstrap a Debian jail:

    bastille bootstrap bookworm
    bastille create -L myjail bookworm 10.1.1.4

5. Bootstrap HardenedBSD:

    bastille bootstrap 15-stable
    bastille create hardjail 15-stable 10.1.1.5

6. Bootstrap MidnightBSD:

    bastille bootstrap 4.0
    bastille create midnightjail 4.0 10.1.1.6

7. List releases for a specific OS:

    bastille bootstrap --list --type ubuntu
    bastille bootstrap --list --type freebsd
    bastille bootstrap --list --type debian

8. Force refresh cached release list:

    bastille bootstrap --list --refresh

9. Bootstrap with automatic update:

    bastille bootstrap -u 15.0-RELEASE

10. Bootstrap using PkgBase (FreeBSD 15+):

    bastille bootstrap -p 15.0-RELEASE

11. Bootstrap FreeBSD with specific architecture:

    bastille bootstrap 15.0-RELEASE --i386

12. Bootstrap archived EOL release:

    export BASTILLE_URL_FREEBSD=http://ftp-archive.freebsd.org/pub/FreeBSD-Archive/old-releases/
    bastille bootstrap 11.2-RELEASE

Common Workflows
----------------

Setting up a web server jail (Ubuntu):

    bastille bootstrap jammy
    bastille create -L webserver jammy 10.1.1.10
    bastille start webserver
    bastille cmd webserver apt update
    bastille cmd webserver apt install nginx

Setting up a database jail (Debian):

    bastille bootstrap bookworm
    bastille create -L database bookworm 10.1.1.11
    bastille start database
    bastille cmd database apt update
    bastille cmd database apt install postgresql

Development environment (FreeBSD):

    bastille bootstrap 15.0-RELEASE
    bastille create dev 15.0-RELEASE 10.1.1.12
    bastille start dev
    bastille cmd dev pkg install git vim bash

Notes
-----

- These scripts require root privileges to run.
- Make scripts executable with: chmod +x *.sh
- The bootstrap commands require network access to download releases.
- Architecture is auto-detected from the host system.
- Release lists are cached for 1 week in /var/cache/bastille/
- Use --refresh to force update cached release lists.
