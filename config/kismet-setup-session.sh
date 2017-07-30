#!/usr/bin/env /bin/bash
# name: kismet-setup-session.sh
# description: 
#   Create a session name and directory for kismet 
#   and export these as vars and file
# author: Marcel de Groot (mg.degroot@openmailbox.org)
# date: 2017-07-30
# version: 0.2
# licence:
#   This file is part of uber-stick (https://github.com/mgdegroot/uber-selfie/).
#   Copyright (c) 2017 Marcel de Groot.
#   
#   This program is free software: you can redistribute it and/or modify  
#   it under the terms of the GNU General Public License as published by  
#   the Free Software Foundation, version 3.
#   
#   This program is distributed in the hope that it will be useful, but 
#   WITHOUT ANY WARRANTY; without even the implied warranty of 
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
#   General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License 
#   along with this program. If not, see <http://www.gnu.org/licenses/>.
#

SESSION_FILE="/tmp/kismet_curr_session"
WORK_DIR="/mnt/work/sessions/"
KISMET_SESSION_NAME="$(date +%Y%m%dT%H%M)"

KISMET_BIN="/usr/local/bin/kismet"

KISMET_SESSION_DIR="${WORK_DIR}${KISMET_SESSION_NAME}"

# Test if base dir exists -->
if [ ! -d ${WORK_DIR} ]; then
    echo "Kismet base session directory ${WORK_DIR} does not exit. Exiting..."
    exit 1
fi

if [ -d ${KISMET_SESSION_DIR} ]; then
        echo "Session dir ${KISMET_SESSION_DIR} already exists. Appending seconds."
    KISMET_SESSION_NAME="${KISMET_SESSION_NAME}_$(date +%S)"
    KISMET_SESSION_DIR="${WORK_DIR}${KISMET_SESSION_NAME}"
fi

echo "Using session name: ${KISMET_SESSION_NAME}."
echo "Creating session dir ${KISMET_SESSION_DIR} ..." 
mkdir "${KISMET_SESSION_DIR}"
echo "${KISMET_SESSION_DIR}" > "${KISMET_SESSION_NAME}" 
export KISMET_SESSION_NAME
export KISMET_SESSION_DIR

