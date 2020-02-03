#!/bin/bash
clear

read -p 'SFDX Alias to snapshot: ' SFDXALIAS
sfdx force:org:snapshot:create -d 'SDO Dependencies' -n 'SDODependencies' -o $SFDXALIAS
