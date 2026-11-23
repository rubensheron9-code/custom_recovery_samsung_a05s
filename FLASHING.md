# Flashing TWRP to the Galaxy A05s (SM-A057G/DSN)

Read all of this before starting. Unlocking the bootloader trips Samsung Knox
e-fuses permanently and wipes the phone. Keep a copy of anything you care
about, and download your phone's stock firmware with Frija or samfirm so you
can always restore with Odin if something goes wrong.

You need: a Windows PC, Odin 3.14.4, the built recovery (twrp-a05s-recovery.tar
from the Actions artifact, or recovery.img renamed into a tar), and a USB cable
with a working data connection.

## 1. Unlock the bootloader

1. Enable developer options: Settings, About phone, Software information, tap
   Build number 7 times.
2. Settings, Developer options, turn on OEM unlock.
3. Power the phone off.
4. Hold Volume Down and Volume Up together and plug in the USB cable (or plug
   the cable in first, then hold both). The phone boots to Download mode (blue
   warning screen).
5. Long-press Volume Up to confirm unlocking the bootloader. The phone wipes
   itself and reboots.
6. Set it up again. Developer options will now show OEM unlock as greyed-out
   with a note that the bootloader is unlocked. Download mode shows the unlock
   state too.

## 2. Flash the recovery with Odin

1. Power off, enter Download mode again (both volume keys + cable).
2. Open Odin. Only the AP slot is used: click AP and select
   twrp-a05s-recovery.tar. Leave all options at their defaults.
3. Click Start. Odin shows PASS in green when it finishes and the phone
   reboots.
4. Immediately pull the cable and hold Volume Up + Power (or just keep holding
   Volume Up once the screen goes black) to boot straight into TWRP instead of
   the system. Samsung boots the stock recovery once otherwise; TWRP survives
   this, so simply booting recovery again works.

## 3. First boot in TWRP

1. If you are asked to keep the data partition read-only or wipe it, choose
   Format Data (Wipe, Format Data). Data was encrypted by stock Android and
   TWRP cannot read it until you wipe.
2. Reboot to recovery once more, then check that internal storage mounts.

## 4. After TWRP: installing a ROM or GSI

1. Copy the ROM zip or GSI image to an SD card or USB drive, or use TWRP's
   ADB sideload (Advanced, ADB Sideload) and push it from the PC with
   `adb sideload file.zip`.
2. For a GSI: Wipe, Advanced Wipe, tick system, vendor, product, system_ext,
   data, cache and dalvik, then Install the GSI image into the system partition
   (or follow the GSI guide you are using; the Odin super.img route in
   Mohommed-Iflan's A05s GSI repo skips TWRP entirely and can be used instead).
3. Reboot. First boot takes several minutes.

## If the phone will not boot

Enter Download mode and flash the stock firmware with Odin: BL, AP, CP and CSC
files from your Frija/samfirm download. Use the CSC file that matches your
region. That returns the phone to stock from almost any recovery mistake.

## Notes for this fork

- The tree was built against One UI 6.1 era SM-A057F firmware. The A057G is the
  same hardware, but if TWRP bootloops or the touchscreen does not work, report
  your exact firmware version (Settings, About phone, Software information,
  Build number) in an issue here.
- Knox, Samsung Pay and the stock Play Integrity verdict do not come back
  after unlocking. GSI ROMs generally pass basic Play Integrity once rooted
  setups are configured, but there is no guarantee.
