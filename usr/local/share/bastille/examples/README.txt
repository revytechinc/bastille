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

Notes
-----

- These scripts require root privileges to run.
- Make scripts executable with: chmod +x *.sh
- The bootstrap commands require network access to download releases.
- Architecture is auto-detected from the host system.
