#!/bin/bash
clear
read -p 'SFDX Alias: ' SFDXALIAS



STARTTIME=$(date +%s)
USRPREFIX='thido-SDO-dep-'$(date +%s)
USRNAME=$USRPREFIX'@example.com'
DEFAULTPWD=Demo12345

./scripts/bash/createScratchOrg.sh $SFDXALIAS $USRNAME $DEFAULTPWD

#./scripts/bash/updateUserName.sh $SFDXALIAS $USRNAME

#./scripts/bash/installAppEx.sh "Demo Component - Lightning File Gallery "$SFDXALIAS

./scripts/bash/installDependencies.sh "$SFDXALIAS"

  #echo
  #echo '***** Installing IDO TTH Guest 360 - Latest'
  #sfdx force:package:install --package "IDO TTH Guest 360 - Latest" -w 1000 -u $SFDXALIAS


./scripts/bash/pushLocalSource.sh "$SFDXALIAS"

# EDIT to apply an permission sets that are specific to your scratch org...
#./scripts/bash/applyPermSets.sh tth_BookingReservation_Data_Model $SFDXALIAS


#./scripts/bash/loadDevData.sh "$SFDXALIAS"


#echo
#echo 'Lining up Icons to NBA Recommendations...'
#sfdx force:apex:execute -f scripts/apex/applyNBAIcons.apex -u $SFDXALIAS


#if [ "$DEPLOYDP" == 'y' ]; then
#  echo
#  echo 'This is a fuller build, loading Datapack dataset...'
  #read -p 'Scratch default username: ' scratchUser
  #read -p 'Scratch encrypted password:' scratchPass
#  ./scripts/bash/loadProdData.sh $USRNAME $SCRATCH_PWD https://test.salesforce.com

#  sfdx force:apex:execute -f scripts/apex/applyBookingImages.apex -u $SFDXALIAS
#fi

#sfdx shane:theme:activate -n THDark -u $SFDXALIAS

ENDTIME=$(date +%s)

echo
echo '************************************************************************'
echo "Build took $(($ENDTIME - $STARTTIME)) seconds to complete..."
echo '************************************************************************'
echo


#CURDATE=$(date +"%m/%d/%Y %H:%M")
#echo "Full Build,$CURDATE,$(($ENDTIME - $STARTTIME))"  >> logs/buildTimes.csv

echo
echo '******************'
echo 'Opening the org...'
echo '******************'
echo

# Open org to default homepage
sfdx force:org:open -p /lightning/page/home -u $SFDXALIAS
