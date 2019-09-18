# optimise-for-audio-win
A collection of scripts for optimising Windows 10 for real-time and network audio.
> Warning: these scripts edit values in the registry. I recommnend [backing up your registry](https://support.microsoft.com/en-gb/help/322756/how-to-back-up-and-restore-the-registry-in-windows) first.

# optimise.bat
> Warning: running this script will remove your existing Power Configurations.

To optimise Windows for real-time audio, simply run 'optimise.bat'.

# start_realtime.bat
To automatically start a process with real-time priority, run:

`start_realtime.bat <path_to_app_without_quotes>`

For example:

`start_realtime.bat C:\Windows\notepad.exe`

If you don't have administrator priviledges, you will recieve a prompt.

# What does the script do?

The scripts provided are designed to automate some of the things that you can do to try and improve the performance of real-time and network audio. """optimise.bat""" script performs the following actions:

## Power
* Add a custom, high performance power plan
* Set sleep and hibernation options to 'Never'
* Disable hard disk and USB suspend

## Performance
* Set processing scheduling to 'Background Services'
* Disable Visual Effects
* Turn off paging

## Network
* Disable all WiFi adapters
* Disable Flow Control and Interrupt Moderation
* Disable Nagle's algorithm

## Miscellaneous
* Disable system sounds
* Disable Windows background apps
* Disable User Account Control
* Disable Bluetooth adapters
* Disable automatic Windows Updates
* *TODO: Disable 'Windows updates from more than one place'*

# What else can I do?

Some of the steps to better audio performance can't be automated. You can perform the following changes manually to try and improve performance:

## BIOS
* Disable Fast Boot/Fast Startup
* Disable C-state transitions
* Disable Turbo Boost
* Disable SpeedStep
* Disable hyper-threading
* Disable spread sprectrum

## Audio drivers
* Set buffer size to the highest possible value (with acceptable latency)

## Network audio (i.e. Dante) drivers
* Set the ASIO latency to the highest possible setting
* Set the network audio driver latency to the highest possible setting

# Further reading

The recommend changes here are based on the following resources:

* [Serato - PC Optimization Guide for Windows](https://support.serato.com/hc/en-us/articles/203057850-PC-Optimization-Guide-for-Windows-8)
* [Focusrite - Optimising your PC for Audio on Windows 10 ](https://support.focusrite.com/hc/en-gb/articles/207355205-Optimising-your-PC-for-Audio-on-Windows-10)
* [Universal Audio - Windows Optimization - Optional Settings](https://help.uaudio.com/hc/en-us/articles/214426026-Windows-Optimization-Optional-Settings)
* [Ableton - Optimizing Windows for Audio](https://help.ableton.com/hc/en-us/articles/209071469-Optimizing-Windows-for-Audio)
* [Avid - Windows 10 Optimizations and Troubleshooting](http://avid.force.com/pkb/articles/en_US/Troubleshooting/Windows-10-Guide)
* [Audinate - How can I tune a windows PC for best audio performance?](https://www.audinate.com/faq/how-can-i-tune-windows-pc-best-audio-performance)
* [Cantabile ‘Glitch Free’ guide](https://www.cantabilesoftware.com/glitchfree/)

