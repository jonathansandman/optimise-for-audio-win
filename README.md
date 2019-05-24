# optimise-for-audio-win
A collection of scripts for optimising Windows 10 for real-time and network audio

# optimise.bat
To optimise Windows for real-time audio, simply run 'optimise.bat'.

# start_realtime.bat
To automatically start a process with real-time priority, run:

`start_realtime.bat <path_to_app_without_quotes>`

For example:

`start_realtime.bat C:\Windows\notepad.exe`

If you don't have administrator priviledges, you will recieve a prompt.

## Automated configuration

### Power
* Selects the High Performance power plan
* Sets sleep and hibernation options to 'Never'
* Disabled hard disk and USB suspend

### Performance
* Sets processing scheduling to 'Background Services'
* Disables Visual Effects
* Turns off paging

### Network
* Disables all WiFi adapters
* Disables Flow Control and Interrupt Moderation
* Disable Nagle's algorithm

### Miscellaneous
* Disables system sounds
* Disables Windows background apps
* Disables User Account Control
* Disables Bluetooth adapters
* TODO: Disable 'Windows updates from more than one place'
* TODO: Disable automatic Windows Updates

## Manual configuration

### BIOS
* Disabled Fast Boot/Fast Startup
* Disaabled C-state transitions, Turbo Boost and SpeedStep
* Disable hyper-threading
* Disable spread sprectrum

### Audio drivers
* Set bufer size to the highest possible settings

### Network audio (i.e. Dante) drivers
* Set the ASIO latency to the highest possible setting
* Set the network audio driver latency to the highest possiblesetting
