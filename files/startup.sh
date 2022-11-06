#!/bin/bash

# Source the Oracle Home Binaries
source /opt/oracle/product/21c/dbhomeXE/bin/oraenv
sleep 1
echo "Starting up OracleDB..."
(echo "STARTUP;"; echo "EXIT;") | sqlplus -S SYS/$DB_PASS AS SYSDBA

clear
# Start SQLPlus with Keyboard Support
rlwrap sqlplus $USER/$PASS

echo "SQL*Plus has stopped."
/bin/bash
