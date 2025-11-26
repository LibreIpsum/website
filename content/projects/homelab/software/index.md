+++
date = '2025-11-23T21:43:51-05:00'
draft = true
title = 'Software'
authors = ["Andrew Warner"]
tags = ["homelab", "software"]
coverCaption = "Metrics Dashboard"
+++

## Raspberry Pi

This used to be my entire homelab, running multiple services on docker and acting as a NAS. Since upgrading, the Pi serves as a high-availability host a WireGuard VPN and DNS for the entire Homelab. Previously, all of my containers ran on the Pi, but I have moved most of them to a virtual machine on my Proxmox host.

The Pi runs Raspberry Pi OS lite, with the Cockpit management interface. I have WireGuard installed through PiVPN and docker containers for Pi-Hole and Nginx Proxy Manager for DNS and Beszel for monitoring. This is probably the device that needs a reinstallation next, since there is still some bloat left from when it ran everything else.

## NAS

My optiplex nas runs OpenMediaVault. The two disks are set up in a zfs pool, which should allow me to more easily expand my storage in the future. I have nfs shares for movies, photos, and Proxmox backups. I also have a nas folder shared over smb.
