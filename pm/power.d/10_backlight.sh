#!/bin/sh

# This script dims the LCD backlight and, if present, the keyboard backlight,
# when the power is unplugged. It also restores the maximum values when the AC
# power is reconnected.

LCD=0
KBD=0
if [ -f /sys/class/backlight/acpi_video0/max_brightness ]; then
    LCD=1
    MAX_LCD_BRIGHTNESS=`cat /sys/class/backlight/acpi_video0/max_brightness`
fi

if [ -f /sys/class/leds/smc\:\:kbd_backlight/max_brightness ]; then
    KBD=1
    MAX_KBD_BRIGHTNESS=`cat /sys/class/leds/smc\:\:kbd_backlight/max_brightness`
fi

case "$1" in
    true)
        if [ $LCD -eq 1 ]; then
            # reduce brightness to 50%
            echo "$MAX_LCD_BRIGHTNESS/2" | bc > /sys/class/backlight/acpi_video0/brightness
        fi

        if [ $KBD -eq 1 ]; then
            # turn off keyboard backlight
            echo 0 > /sys/class/leds/smc\:\:kbd_backlight/brightness
        fi

        # enable power save for soundcard
        echo Y > /sys/module/snd_hda_intel/parameters/power_save_controller
        echo 1 > /sys/module/snd_hda_intel/parameters/power_save
    ;;
    false)
        if [ $LCD -eq 1 ]; then
            # restore brightness to 100%
            echo $MAX_LCD_BRIGHTNESS > /sys/class/backlight/acpi_video0/brightness
        fi

        if [ $KBD -eq 1 ]; then
            # turn on keyboard backlight
            echo $MAX_KBD_BRIGHTNESS > /sys/class/leds/smc\:\:kbd_backlight/brightness
        fi

        # disable power save for soundcard
        echo N > /sys/module/snd_hda_intel/parameters/power_save_controller
        echo 0 > /sys/module/snd_hda_intel/parameters/power_save
    ;;
esac

# For more options, see http://crunchbanglinux.org/forums/topic/11954

exit 0
