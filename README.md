# optimise-for-audio-win
A collection of scripts for optimising Windows 10 for real-time and network audio

# optimise.bat
> Warning: running this script will remove your existing Power Configurations

To optimise Windows for real-time audio, simply run 'optimise.bat'.

# start_realtime.bat
To automatically start a process with real-time priority, run:

`start_realtime.bat <path_to_app_without_quotes>`

For example:

`start_realtime.bat C:\Windows\notepad.exe`

If you don't have administrator priviledges, you will recieve a prompt.

# What does the script do?

## Power
* Adds a custom, high performance power plan
* Set sleep and hibernation options to 'Never'
* Disabled hard disk and USB suspend

## Performance
* Set processing scheduling to 'Background Services'
* Disable Visual Effects
* Turn off paging

## Network
* Disable all WiFi adapters
* Disable Flow Control and Interrupt Moderation
* Disable Nagle's algorithm

## Miscellaneous
* Disables system sounds
* Disables Windows background apps
* Disables User Account Control
* Disables Bluetooth adapters
* Disables automatic Windows Updates
* TODO: Disable 'Windows updates from more than one place'

# What else can I do?

## BIOS
* Disable Fast Boot/Fast Startup
* Disable C-state transitions, Turbo Boost and SpeedStep
* Disable hyper-threading
* Disable spread sprectrum

## Audio drivers
* Set buffer size to the highest possible value (with acceptable latency)

## Network audio (i.e. Dante) drivers
* Set the ASIO latency to the highest possible setting
* Set the network audio driver latency to the highest possible setting
