#!/bin/sh
#
# SPDX-License-Identifier: BSD-3-Clause
#
# Copyright (c) 2018-2025, Christer Edwards <christer.edwards@gmail.com>
# All rights reserved.
#
# Example script: Bootstrap common releases for testing
#
# This script bootstraps a set of commonly used releases.
# Adjust the arrays below to customize which releases to bootstrap.

set -e

echo "=== Bootstrapping FreeBSD releases ==="
bastille bootstrap 15.0-RELEASE
bastille bootstrap 14.2-RELEASE

echo ""
echo "=== Bootstrapping Ubuntu releases ==="
bastille bootstrap jammy
bastille bootstrap noble

echo ""
echo "=== Bootstrapping Debian releases ==="
bastille bootstrap bookworm

echo ""
echo "=== Bootstrap complete ==="
echo "Run 'bastille list releases' to see all bootstrapped releases"
