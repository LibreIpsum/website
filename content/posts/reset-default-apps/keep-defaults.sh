#!/bin/bash

# This script installs the applications listed in the arguments, but prevents them from registering themselves as the default application for any files.
# This is useful, for example, if you need to install a second web browser without replacing your current one.

# The first step is to make backups of the current default applications list.
sudo echo "Copying mimeinfo files"
sudo cp /usr/share/applications/mimeinfo.cache /tmp/mimeinfo.cache
cp ~/.config/mimeapps.list /tmp/mimeapps.list

# Install the applications
# Here, I use pacman, but this command can easily be replaced with another package manager.
echo "Installing applications"
sudo pacman -S "$@"

# Now replace the newly generated mimeinfofiles with the backups
echo "Cleaning up"
sudo rm /usr/share/applications/mimeinfo.cache
sudo mv /tmp/mimeinfo.cache /usr/share/applications/mimeinfo.cache

rm ~/.config/mimeapps.list
mv /tmp/mimeapps.list ~/.config/mimeapps.list
echo "Done!"