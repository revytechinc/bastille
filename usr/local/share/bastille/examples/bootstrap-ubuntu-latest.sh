#!/bin/sh
#
# SPDX-License-Identifier: BSD-3-Clause
#
# Copyright (c) 2018-2025, Christer Edwards <christer.edwards@gmail.com>
# All rights reserved.
#
# Example script: Bootstrap latest Ubuntu LTS release
#
# This script discovers and bootstraps the latest Ubuntu LTS release.

set -e

echo "Discovering available Ubuntu releases..."
RELEASES=$(bastille bootstrap --list --type ubuntu 2>/dev/null | grep "LTS" | head -1)

if [ -z "${RELEASES}" ]; then
    echo "No Ubuntu LTS releases found. Trying to bootstrap 'noble'..."
    bastille bootstrap noble
else
    # Extract the codename (first word before the version number)
    CODENAME=$(echo "${RELEASES}" | awk '{print $1}')
    echo "Bootstrapping latest Ubuntu LTS: ${CODENAME}"
    bastille bootstrap "${CODENAME}"
fi

echo ""
echo "Ubuntu bootstrap complete!"
