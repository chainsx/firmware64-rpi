# Preface

I owe my very rapid learning journey in the world of ConfigFs to several key sources which aren't necessarily relevant
to this result, but I feel deserve a mention anyway.

* This *really* demystified configfs for me, and stopped me being afraid of it: http://events.linuxfoundation.org/sites/events/files/slides/USB%20Gadget%20Configfs%20API_0.pdf
* I borrowed *heavily* from this Mindstorms EV3 script: https://github.com/ev3dev/ev3-systemd/blob/ev3dev-jessie/scripts/ev3-usb.sh
* Desperately trawled this thread for answers: https://answers.microsoft.com/en-us/windows/forum/windows_10-networking-winpc/windows-10-vs-remote-ndis-ethernet-usbgadget-not/cb30520a-753c-4219-b908-ad3d45590447?auth=1
* This guide is handy: http://irq5.io/2016/12/22/raspberry-pi-zero-as-multiple-usb-gadgets/

# The Result

One of the biggest and most repeated issues with the Pi Zero and OTG USB is that a composite gadget including RNDIS Ethernet for
Ethernet-over-USB support in Windows will *not* automatically install drivers and, furthermore, is a heinous pain to install drivers
for. My original idea was to develop and sign drivers to solve this problem- I still plan to do that, because the solution presented
here is a hack - but it turned out signing inf files is really waaay more complex than it has any right to be.

So, using the resources above, plus some others (probably) which I've forgotten, and lots, and lots and lots of trial and error
I finally accidentally hit upon a method to trick Windows 10 - repeatably I believe - into installing RNDIS drivers for a composite gadget.

# The Technique

The technique is ridiculously simple;

* Set up an RNDIS gadget using a VID/PID of a known good device that's compatible with composite RNDIS
* Set bDeviceClass and bDeviceSubClass to 0x02 for a valid gadget
* Set up the "os_desc" node with Windows magic (I don't think this is 100% necessary, but voodoo is voodoo!
* Link *only* the RNDIS function to the config
* Attach the USB gaget to the device
* Wait some time for Windows to detect/install drivers- 5sec seems plenty as it happens, some experimentation required here
* Detach the USB gadget
* Link the rest of your functions- Mass Storage, Serial ACM, etc ( So far only tested with these )
* Set bDeviceClass to 0x00
* Re-attach the USB gadget
* Now it should show up - in Windows 10 at least - as a composite gadget with functional RNDIS, Serial and Mass Storage. Yay!

# Changelog

2017-11-05 - 00:26 - Tweaked to better support OSX. Still no RNDIS funcionality in 10.12, but Mass Storage and Serial seem to work