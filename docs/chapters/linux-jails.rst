Linux Jails
===========

Bastille can create Linux jails using the ``debootstrap`` tool. When
attempting to create a Linux jail, Bastille will need to load some modules
as well as install the ``debootstrap`` package.

Getting Started
---------------

To get started, run ``bastille setup linux`` to load required modules
and install the ``debootstrap`` package.

Bootstrapping a Linux Release
-----------------------------

First, discover what Linux releases are available for your architecture:

.. code-block:: shell

  ishmael ~ # bastille bootstrap --list --type ubuntu
  Available Ubuntu Releases (amd64):
    bionic (18.04)
    focal (20.04)
    jammy (22.04)
    noble (24.04)

  ishmael ~ # bastille bootstrap --list --type debian
  Available Debian Releases (amd64):
    bookworm (12)
    trixie (13)

To bootstrap a Linux release, run ``bastille bootstrap`` with the release name:

.. code-block:: shell

  # Bootstrap Ubuntu LTS releases
  ishmael ~ # bastille bootstrap jammy
  ishmael ~ # bastille bootstrap noble

  # Bootstrap Debian releases
  ishmael ~ # bastille bootstrap bookworm
  ishmael ~ # bastille bootstrap trixie

Available Ubuntu Releases
^^^^^^^^^^^^^^^^^^^^^^^^

Ubuntu releases use codenames. The following are commonly available:

- ``bionic`` - Ubuntu 18.04 LTS
- ``focal`` - Ubuntu 20.04 LTS
- ``jammy`` - Ubuntu 22.04 LTS
- ``noble`` - Ubuntu 24.04 LTS

Available Debian Releases
^^^^^^^^^^^^^^^^^^^^^^^^^

Debian releases use codenames. The following are commonly available:

- ``buster`` - Debian 10 (EOL)
- ``bullseye`` - Debian 11
- ``bookworm`` - Debian 12
- ``trixie`` - Debian 13 (testing)

Creating a Linux Jail
---------------------

To create a Linux jail, run ``bastille create -L mylinuxjail release ip4addr``:

.. code-block:: shell

  ishmael ~ # bastille create -L myjail jammy 10.1.1.3
  ishmael ~ # bastille create -L webserver jammy 10.1.1.4
  ishmael ~ # bastille create -L dbserver bookworm 10.1.1.5

The ``-L`` flag indicates this is a Linux jail. Once the jail is created,
proceed to do your "linux stuff".

Managing Linux Jails
--------------------

Linux jails work like regular FreeBSD jails with some limitations:

.. code-block:: shell

  # Start the Linux jail
  ishmael ~ # bastille start myjail

  # Execute commands inside the Linux jail
  ishmael ~ # bastille cmd myjail apt update
  ishmael ~ # bastille cmd myjail apt install nginx

  # Stop the jail
  ishmael ~ # bastille stop myjail

Limitations
-----------

* Linux jails are still considered experimental.

* Linux jails cannot be created with any type of VNET options.