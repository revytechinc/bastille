#!/bin/sh
#
# SPDX-License-Identifier: BSD-3-Clause
#
# Copyright (c) 2018-2025, Christer Edwards <christer.edwards@gmail.com>
# All rights reserved.
#
# Example script: Bootstrap latest FreeBSD RELEASE
#
# This script discovers and bootstraps the latest FreeBSD RELEASE.

set -e

echo "Discovering available FreeBSD releases..."
LATEST=$(bastille bootstrap --list --type freebsd 2>/dev/null | grep -E "^[0-9]+\.[0-9]+-RELEASE" | head -1)

if [ -z "${LATEST}" ]; then
    echo "Could not discover FreeBSD releases. Trying to bootstrap 14.2-RELEASE..."
    bastille bootstrap 14.2-RELEASE
else
    echo "Bootstrapping latest FreeBSD RELEASE: ${LATEST}"
    bastille bootstrap "${LATEST}"
fi

echo ""
echo "FreeBSD bootstrap complete!"
