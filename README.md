# TWRP device tree for Samsung Galaxy A05s (SM-A057F and SM-A057G/DSN)

Device tree for building TWRP 12.1 for the Samsung Galaxy A05s, based on the
work by FathanIhdhar296, TheNoobDevs and jokonotobot0. This fork is set up for
the SM-A057G/DSN variant. The A057F and A057G are the same hardware (Snapdragon
680, "bengal" platform); only the model string differs.

## Build

Start from the TWRP 12.1 minimal manifest, then clone this tree:

```
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync
git clone https://github.com/rubensheron9-code/custom_recovery_samsung_a05s.git device/samsung/a05s -b twrp-12.1
```

Then build:

```
. build/envsetup.sh
lunch twrp_a05s-eng
mka recoveryimage
```

The prebuilt kernel, dtb and dtbo in `prebuilt/` are used, so no kernel source
build is needed. The output is `out/target/product/a05s/recovery.img`.

## GitHub Actions build

A workflow at `.github/workflows/build.yml` builds the recovery on GitHub's
runners (run it manually from the Actions tab) and uploads the `recovery.img`
and an Odin-flashable `.tar` as build artifacts.

## Flashing (both variants)

1. Unlock the bootloader first: enable OEM unlock in developer options, boot to
   Download mode, and hold volume up to confirm the unlock. This trips Knox
   e-fuses permanently and wipes the phone.
2. Flash `recovery.img` via Odin in the AP slot (or the provided tar), or via
   fastboot from the unlocked bootloader.
3. Boot into recovery and test before flashing anything else.

This tree was built against One UI 6.1 era A057F firmware. On an SM-A057G, check
your firmware version and expect to debug boot issues; an untested recovery can
bootloop the device. Keep your stock firmware handy (samfirm or Frija) to
restore with Odin if it does not boot.
