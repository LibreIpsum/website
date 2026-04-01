+++
date = '2026-03-31T22:57:23-04:00'
draft = false
title = 'Install Applications on Linux Without Changing your Default Applications'
publishDate = '2026-03-31T22:57:23-04:00'
authors = ["Andrew Warner"]
tags = ["Linux", "Scrips"]
+++

Normally, I use firefox, but recently I needed a Chromium based browser in order to use a website with WebUSB. However, every time I install a new web brower, it takes over file permissions for whatever it wants, including  but not limited to: xml and json (should open in vscode), images (should use default image viewer), and html documents (vscode or firefox). I never want chromium to be the default for anything because it is a secondary broser. I have finally found a solution to prevent these applications from replacing the default apps without manually resetting each one.

{{< alert >}}
The info here is based on my use of the Xfce desktop environment on Arch Linux. Check if your desktop has a different setup.
{{< /alert >}}

## The Solution

What I finally figured out is that there are two files that store xdg mime info for applications. They are at `~/config/mimeapps.list` and `/usr/share/applications/mimeinfo.cache`. In order to keep our current mime configuration, we can copy these files to a temporary directory, install our packages, and then replace the updated files with our backups.

The files can be moved to `/tmp` with

```bash
sudo cp /usr/share/applications/mimeinfo.cache /tmp/mimeinfo.cache
cp ~/.config/mimeapps.list /tmp/mimeapps.list
```

Next, install your applications using your system's package manager

```bash
sudo pacman -S chromium
# or
sudo apt install chromium-broser
# or
sudo dnf install chromium
```

Finally, remove the new mime files and move back the old ones:

```bash
sudo rm /usr/share/applications/mimeinfo.cache
sudo mv /tmp/mimeinfo.cache /usr/share/applications/mimeinfo.cache

rm ~/.config/mimeapps.list
mv /tmp/mimeapps.list ~/.config/mimeapps.list
```


After I got this working, I converted it to a bash script that I can pass a list of packages to install. This one works with pacman:

```bash
# First, make backups of the current default applications list.
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
```