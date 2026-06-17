#!/bin/sh
#
# SPDX-License-Identifier: BSD-3-Clause
#
# Copyright (c) 2018-2025, Christer Edwards <christer.edwards@gmail.com>
# All rights reserved.
#
# Example script: List all available releases
#
# Usage:
#   ./list-releases.sh [freebsd|hardenedbsd|midnightbsd|ubuntu|debian]
#
# If no argument is given, lists all available releases.

TYPE="${1:-all}"

bastille bootstrap --list --type "${TYPE}"
