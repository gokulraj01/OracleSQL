# OracleSQL Container
 - Oracle Database XE 21c installed within a **Docker** instance of Oracle Linux 8.
 - Useful to practice SQL on OracleDB for KTU S4/S5 Database Lab.
 - This is not a proper implementation. Only useful for practicing SQL on a non persistant DB instance.

## How to use?
User is expected to have Docker installed. (Tested on Ubuntu 22.04)
- Download Oracle Database package
    ```bash
    wget https://edelivery.oracle.com/otn-pub/otn_software/db-express/oracle-database-xe-21c-1.0-1.ol8.x86_64.rpm -P files/
    ```
- Before first use, build the image.
    ```bash
    bash build.sh
    ```
    *NOTE: This can take a long time to complete.*

- After build, and for subsequent runs:
    ```bash
    bash run.sh
    ```
- ### Manual run
    ```bash
    # After build and run, in a new terminal
    # Enter into Oracle Linux container
    sudo docker exec -it OracleSQL /bin/bash
    
    # Run SQL*Plus
    # Login using default username and password
    sqlplus
    ```

## Misc.
Ref: https://stackoverflow.com/questions/62574379/su-permission-denied-despite-being-root-in-oracle-container

```
Database Information:
Global Database Name:XE.localhost
System Identifier(SID):XE

Connect to Oracle Database using one of the connect strings:
     Pluggable database: /XEPDB1
     Multitenant container database: 
Use https://localhost:5500/em to access Oracle Enterprise Manager for Oracle Database XE

SYS AS SYSDBA, SYSTEM and PDBADMIN accounts
Password: oracledb

Default User
------------
user: DBUSER
pass: welcome
```

### Please note this is intended for academic use only, for students to quickly start practicing locally without wasting time in environment setup.