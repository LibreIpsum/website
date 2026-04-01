+++
date = '2026-03-31T22:57:23-04:00'
draft = true
title = 'Install Applications on Linux Without Changing your Default Applications'
# publishDate = '2025-11-27T15:15:00-05:00'
authors = ["Andrew Warner"]
tags = ["Linux", "Scrips"]
+++

Normally, I use firefox, but recently I needed a Chromium based browser in order to use a website with WebUSB. However, every time I install a new web brower, it takes over file permissions for whatever it wants, including  but not limited to: xml and json (should open in vscode), images (should use default image viewer), and html documents (vscode or firefox). I never want chromium to be the default for anything because it is a secondary broser. I have finally found a solution to prevent these applications from replacing the default apps without manually resetting each one.

{{< alert >}}
The info here is based on my use of the Xfce desktop environment on Arch Linux. Check if your desktop has a different setup.
{{< /alert >}}

## The Solution

What I finally figured out is that there are two files that store xdg mime info for applications
