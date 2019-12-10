
# create scratch org
echo
echo '*************************************************'
echo 'Creating a fresh Scratch org called' $@
echo '*************************************************'
echo
sfdx force:org:create -s -f config/project-scratch-def.json -a $@

echo
echo '**************************************'
echo 'Installing any listed dependencies...'
echo '**************************************'
echo

# Install any dependencies
sfdx texei:package:dependencies:install -u $@

echo
echo '********************************************************'
echo 'Move over unpackaged assets for development work........'
echo '********************************************************'
echo
#cp -a unpackaged/main/default/. tth-sdo/main/default/


echo
echo '********************************************************'
echo 'Pushing local code/config into the empty Scratch org...'
echo '********************************************************'
echo

# Push local source
sfdx force:source:push -u $@

echo
echo '*********************************************'
echo 'Adding permission sets to the default user...'
echo '*********************************************'
echo
# add permission set
#sfdx force:user:permset:assign --permsetname tth_Loyalty_Data_Model -u $@
#sfdx force:user:permset:assign --permsetname tth_BookingReservation_Data_Model -u $@
#sfdx force:user:permset:assign --permsetname tth_Reservation_Hospitality_Fields -u $@
#sfdx force:user:permset:assign --permsetname tth_Reservation_Airline_Fields -u $@
#sfdx force:user:permset:assign --permsetname tth_Traveler_Record -u $@
#sfdx force:user:permset:assign --permsetname tth_Rental_Preference_fields -u $@
#sfdx force:user:permset:assign --permsetname tth_Hospitality_Preference_fields -u $@
#sfdx force:user:permset:assign --permsetname tth_Airline_Preference_fields -u $@

echo
echo '***********************'
echo 'Loading initial data...'
echo '***********************'
echo
# load data
#sfdx force:data:tree:import --plan data/data-load-plan.json

echo
echo '******************'
echo 'Opening the org...'
echo '******************'
echo

# Open org to default homepage
sfdx force:org:open -p /lightning/page/home -u $@
