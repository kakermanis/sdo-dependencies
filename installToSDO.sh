echo "Installing IDO TTH COMMONS package..."
sfdx force:package:install --package "IDO TTH Commons@0.1.0-2" -u SDO --wait 30

echo "Installing IDO TTH Traveler Base Datamodel package..."
sfdx force:package:install --package "IDO TTH Traveler Base Datamodel@0.1.0-1" -u SDO --wait 30

echo "Installing IDO TTH Loyalty Datamodel package..."
sfdx force:package:install --package "IDO TTH Loyalty Datamodel@0.1.0-2" -u SDO --wait 30

echo "Installing IDO TTH Res/Booking datamodel package..."
sfdx force:package:install --package "IDO TTH Reservation/Booking Datamodel@0.1.0-1" -u SDO --wait 30
