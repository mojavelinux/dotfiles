#!/bin/sh

# This script will initialize my personal desktop preferences on a fresh
# or existing installation of Linux.

# Keyboard Settings
gconftool-2 --type bool --set /desktop/gnome/accessibility/keyboard/enable 0
gconftool-2 --type bool --set /desktop/gnome/accessibility/keyboard/stickykeys_enable 1
gconftool-2 --type bool --set /desktop/gnome/accessibility/keyboard/stickykeys_modifier_beep 0
gconftool-2 --type bool --set /desktop/gnome/accessibility/keyboard/stickykeys_two_key_off 0
gconftool-2 --type int --set /desktop/gnome/peripherals/keyboard/delay 250
gconftool-2 --type int --set /desktop/gnome/peripherals/keyboard/rate 40
gconftool-2 --type bool --set /desktop/gnome/peripherals/touchpad/disable_while_typing 0 # Starting syndaemon manually
gconftool-2 --type bool --set /desktop/gnome/peripherals/touchpad/horiz_scroll_enabled 1
gconftool-2 --type bool --set /desktop/gnome/peripherals/touchpad/tap_to_click 1
gconftool-2 --type list --list-type string --set /desktop/gnome/peripherals/keyboard/kbd/options ["ctrl	ctrl:nocaps","terminate	terminate:ctrl_alt_bksp"]

# Mouse settings
#gconftool-2 --type int --set /desktop/gnome/peripherals/mouse/cursor_size 24 # 24, 36, 48
#gconftool-2 --type bool --set /apps/compiz/plugins/ezoom/screen0/options/hide_original_mouse 1
#gconftool-2 --type bool --set /apps/compiz/plugins/ezoom/screen0/options/scale_mouse 1
#gconftool-2 --type float --set /apps/compiz/plugins/ezoom/screen0/options/speed 10

# Compiz settings
gconftool-2 --type int --set /apps/compiz/general/screen0/options/hsize 6
gconftool-2 --type int --set /apps/compiz/general/screen0/options/vsize 1
gconftool-2 --type int --set /apps/compiz/plugins/move/allscreens/options/opacity 90
gconftool-2 --type bool --set /apps/compiz/plugins/wall/allscreens/options/miniscreen 1
gconftool-2 --type bool --set /apps/compiz/plugins/wall/allscreens/options/allow_wraparound 1
gconftool-2 --type int --set /apps/compiz/plugins/wall/allscreens/options/preview_scale 200
gconftool-2 --type string --set /apps/compiz/plugins/expo/allscreens/options/expo_key "<Control><Alt>Down"
gconftool-2 --type string --set /apps/compiz/plugins/switcher/allscreens/options/next_key "<Alt><Control>Tab"
#gconftool-2 --type string --set /apps/compiz/plugins/switcher/allscreens/options/next_all_key "<Alt>Tab"
gconftool-2 --type string --set /apps/compiz/plugins/switcher/allscreens/options/prev_key "<Alt><Shift><Control>Tab"
#gconftool-2 --type string --set /apps/compiz/plugins/switcher/allscreens/options/prev_all_key "<Alt><Shift>Tab"
gconftool-2 --type string --set /apps/compiz/plugins/staticswitcher/allscreens/options/next_all_key "<Alt>Tab"
gconftool-2 --type string --set /apps/compiz/plugins/staticswitcher/allscreens/options/prev_all_key "<Alt><Shift>Tab"
gconftool-2 --type string --set /apps/compiz/plugins/ring/allscreens/options/next_key "<Super><Control>Tab"
gconftool-2 --type string --set /apps/compiz/plugins/ring/allscreens/options/next_all_key "<Super>Tab"
gconftool-2 --type string --set /apps/compiz/plugins/ring/allscreens/options/prev_key "<Super><Shift><Control>Tab"
gconftool-2 --type string --set /apps/compiz/plugins/ring/allscreens/options/prev_all_key "<Super><Shift>Tab"

# Metacity settings
gconftool-2 --type int --set /apps/metacity/general/num_workspaces 6 # keep enabled just in case not using compiz
# workspace names are not used when compiz is enabled (need workspacenames compiz plugin)
gconftool-2 --type string --set /apps/metacity/workspace_names/name_1 Main
gconftool-2 --type string --set /apps/metacity/workspace_names/name_2 Console
gconftool-2 --type string --set /apps/metacity/workspace_names/name_3 Mail
gconftool-2 --type string --set /apps/metacity/workspace_names/name_4 Develop
gconftool-2 --type string --set /apps/metacity/workspace_names/name_5 File
gconftool-2 --type string --set /apps/metacity/workspace_names/name_6 Media

# Window Settings
gconftool-2 --type string --set /apps/metacity/general/action_double_click_titlebar "toggle_maximize"
gconftool-2 --type string --set /apps/metacity/general/action_middle_click_titlebar "minimize"
gconftool-2 --type string --set /apps/metacity/general/button_layout "maximize:minimize,close" # or menu:minimize,close
gconftool-2 --type bool --set /apps/metacity/general/visual_bell 1
gconftool-2 --type bool --set /apps/metacity/general/audible_bell 0
gconftool-2 --type string --set /apps/metacity/general/visual_bell_type "frame_flash"
gconftool-2 --type bool --set /apps/metacity/general/auto_raise 0
gconftool-2 --type int --set /apps/metacity/general/auto_raise_delay 500 # only if auto_raise is enabled
gconftool-2 --type string --set /apps/metacity/general/focus_mode "click" # set to 'sloppy' for focus follows mouse
#gconftool-2 --type string --set /apps/metacity/window_keybindings/toggle_fullscreen F11

gconftool-2 --type string --set /apps/gnome_settings_daemon/keybindings/media "<Mod4>b"
gconftool-2 --type string --set /apps/gnome_settings_daemon/keybindings/play "Pause"
gconftool-2 --type string --set /apps/gnome_settings_daemon/keybindings/www "XF86HomePage"
gconftool-2 --type string --set /apps/compiz/plugins/scale/allscreens/options/initiate_key "Menu"

# Font settings
gconftool-2 --type string --set /desktop/gnome/font_rendering/antialiasing "rgba" # rgba, grayscale
gconftool-2 --type string --set /desktop/gnome/font_rendering/hinting "slight" # none, slight, medium, full
gconftool-2 --type string --set /desktop/gnome/font_rendering/rgba_order "rgb" # rgb, bgr, vrgb, vbgr

# Nautilus settings
gconftool-2 --type string --set /apps/nautilus/desktop/computer_icon_name "Computer" # Media Devices
gconftool-2 --type string --set /apps/nautilus/desktop/home_icon_name "Dan's Home"
gconftool-2 --type bool --set /apps/nautilus/desktop/home_icon_visible 0
gconftool-2 --type string --set /apps/nautilus/icon_view/default_zoom_level "standard"
gconftool-2 --type string --set /apps/nautilus/preferences/click_policy "single"
gconftool-2 --type bool --set /apps/nautilus/preferences/confirm_trash 0
gconftool-2 --type bool --set /apps/nautilus/preferences/enable_delete 0
gconftool-2 --type bool --set /apps/panel/global/tooltips_enabled 1
gconftool-2 --type bool --set /desktop/gnome/interface/menus_have_tearoff 0
gconftool-2 --type bool --set /desktop/gnome/interface/can_change_accels 1
gconftool-2 --type string --set /desktop/gnome/interface/toolbar_style "both"
gconftool-2 --type string --set /apps/nautilus/icon_view/default_zoom_level "standard"
gconftool-2 --type bool --set /apps/nautilus/icon_view/labels_beside_icons 0
gconftool-2 --type bool --set /apps/nautilus/desktop-metadata/nautilus-icon-view-keep-aligned 1
gconftool-2 --type string --set /apps/nautilus/preferences/date_format "informal"
gconftool-2 --type bool --set /apps/nautilus/preferences/media_automount_open 0
gconftool-2 --type string --set /apps/nautilus/preferences/preview_sound "always"
gconftool-2 --type string --set /apps/nautilus/preferences/show_directory_item_counts "always"
gconftool-2 --type string --set /apps/nautilus/preferences/show_image_thumbnails "always"
gconftool-2 --type bool --set /apps/nautilus/preferences/show_advanced_permissions 1

# Terminal
gconftool-2 --type bool --set /apps/gnome-terminal/profiles/Default/default_show_menubar 0
gconftool-2 --type int --set /apps/gnome-terminal/profiles/Default/scrollback_lines 10000
gconftool-2 --type bool --set /apps/gnome-terminal/profiles/Default/scrollback_unlimited 1
gconftool-2 --type bool --set /apps/gnome-terminal/profiles/Default/silent_bell 0
gconftool-2 --type string --set /apps/gnome-terminal/keybindings/next_tab "<Shift>Right"
gconftool-2 --type string --set /apps/gnome-terminal/keybindings/prev_tab "<Shift>Left"
gconftool-2 --type string --set /apps/gnome-terminal/keybindings/move_tab_right "<Shift><Control>Right"
gconftool-2 --type string --set /apps/gnome-terminal/keybindings/move_tab_left "<Shift><Control>Left"
gconftool-2 --type string --set /apps/gnome-terminal/keybindings/new_tab "<Control>t"
gconftool-2 --type string --set /apps/gnome-terminal/keybindings/zoom_in "<Ctrl>equal"

# Power settings
gconftool-2 --type string --set /apps/gnome-power-manager/actions/critical_battery "suspend"
gconftool-2 --type bool --set /apps/gnome-power-manager/backlight/battery_reduce 1
gconftool-2 --type int --set /apps/gnome-power-manager/backlight/brightness_ac 100
gconftool-2 --type int --set /apps/gnome-power-manager/backlight/brightness_dim_battery 50
gconftool-2 --type bool --set /apps/gnome-power-manager/backlight/enable 1
gconftool-2 --type bool --set /apps/gnome-power-manager/backlight/idle_dim_ac 0
gconftool-2 --type bool --set /apps/gnome-power-manager/backlight/idle_dim_battery 0 
gconftool-2 --type string --set /apps/gnome-power-manager/buttons/lid_ac "blank"
gconftool-2 --type string --set /apps/gnome-power-manager/buttons/lid_battery "suspend"
gconftool-2 --type string --set /apps/gnome-power-manager/buttons/power "interactive"
gconftool-2 --type bool --set /apps/gnome-power-manager/disks/spindown_enabled_ac 0
gconftool-2 --type bool --set /apps/gnome-power-manager/disks/spindown_enabled_battery 1
gconftool-2 --type bool --set /apps/gnome-power-manager/general/can_hibernate 0 # disabled b/c of disk encryption
gconftool-2 --type bool --set /apps/gnome-power-manager/lock/blank_screen 0
gconftool-2 --type bool --set /apps/gnome-power-manager/lock/suspend 1
gconftool-2 --type int --set /apps/gnome-power-manager/timeout/sleep_computer_ac 0
gconftool-2 --type int --set /apps/gnome-power-manager/timeout/sleep_computer_battery 0
gconftool-2 --type int --set /apps/gnome-power-manager/timeout/sleep_display_ac 1800
gconftool-2 --type int --set /apps/gnome-power-manager/timeout/sleep_display_battery 600
gconftool-2 --type string --set /apps/gnome-power-manager/ui/icon_policy "present"
gconftool-2 --type bool --set /apps/gnome-power-manager/ui/show_actions_in_menu 1
gconftool-2 --type bool --set /apps/gnome-power-manager/ui/show_context_menu 1

# Glipper
gconftool-2 --type string --set /apps/glipper/key_combination "&lt;Mod4&gt;c"
gconftool-2 --type int --set /apps/glipper/max_item_length 99
gconftool-2 --type int --set /apps/glipper/max_elements 99
gconftool-2 --type list --list-type string --set /apps/glipper/autostart_plugins ["nopaste","grow"]

# Volumne
gconftool-2 --type int --set /apps/gnome_settings_daemon/volume_step 2

# Screensaver settings
gconftool-2 --type bool --set /apps/gnome-screensaver/lock_enabled 0

# Panel Settings
gconftool-2 --type list --list-type string --set /apps/panel/applets/clock_screen0/prefs/cities ['<location name="" city="Baltimore" timezone="America/New_York" latitude="39.283333" longitude="-76.616669" code="KDMH" current="true"/>','<location name="" city="Edinburgh" timezone="Europe/London" latitude="55.950001" longitude="-3.350000" code="EGPH" current="false"/>','<location name="" city="Brisbane" timezone="Australia/Brisbane" latitude="-27.383333" longitude="153.100006" code="YBBN" current="false"/>','<location name="" city="Denver" timezone="America/Denver" latitude="39.563889" longitude="-104.848335" code="KAPA" current="false"/>','<location name="" city="San Francisco" timezone="America/Los_Angeles" latitude="37.619720" longitude="-122.364723" code="KSFO" current="false"/>']
gconftool-2 --type bool --set /apps/panel/applets/clock_screen0/prefs/expand_locations 1
gconftool-2 --type string --set /apps/panel/applets/clock_screen0/prefs/format "24-hour"
gconftool-2 --type bool --set /apps/panel/applets/clock_screen0/prefs/show_date 1
gconftool-2 --type bool --set /apps/panel/applets/clock_screen0/prefs/show_seconds 0
gconftool-2 --type bool --set /apps/panel/applets/clock_screen0/prefs/show_temperature 1
gconftool-2 --type bool --set /apps/panel/applets/clock_screen0/prefs/show_tooltip 1
gconftool-2 --type bool --set /apps/panel/applets/clock_screen0/prefs/show_weather 1
gconftool-2 --type string --set /apps/panel/applets/clock_screen0/prefs/speed_unit "km/h"
gconftool-2 --type string --set /apps/panel/applets/clock_screen0/prefs/temperature_unit "C"
gconftool-2 --type string --set /apps/panel/toplevels/bottom_panel_screen0/animation_speed "fast"
gconftool-2 --type bool --set /apps/panel/toplevels/bottom_panel_screen0/enable_animations 1
gconftool-2 --type int --set /apps/panel/toplevels/bottom_panel_screen0/hide_delay 200
gconftool-2 --type int --set /apps/panel/toplevels/bottom_panel_screen0/unhide_delay 0

# Gedit
gconftool-2 --type bool --set /apps/gedit-2/preferences/editor/save/create_backup_copy 0
gconftool-2 --type bool --set /apps/gedit-2/preferences/editor/tabs/insert_spaces 1
gconftool-2 --type int --set /apps/gedit-2/preferences/editor/tabs/tabs_size 3
gconftool-2 --type bool --set /apps/gedit-2/preferences/editor/bracket_matching/bracket_matching 1
gconftool-2 --type bool --set /apps/gedit-2/preferences/editor/line_numbers/display_line_numbers 1
gconftool-2 --type bool --set /apps/gedit-2/preferences/editor/right_margin/display_right_margin 1
gconftool-2 --type int --set /apps/gedit-2/preferences/editor/right_margin/right_margin_position 120

# Update Manager
gconftool-2 --type bool --set /apps/update-manager/autoclose_install_window 1
gconftool-2 --type bool --set /apps/update-manager/first_run 0
gconftool-2 --type bool --set /apps/update-manager/remind_reload 0
gconftool-2 --type bool --set /apps/update-manager/show_details 1
gconftool-2 --type bool --set /apps/update-manager/show_versions 1
gconftool-2 --type bool --set /apps/update-notifier/auto_launch 1

# Default apps
gconftool-2 --type string --set /desktop/gnome/url-handlers/mailto/command "mutt %s"
gconftool-2 --type bool --set /desktop/gnome/url-handlers/mailto/enabled 1
gconftool-2 --type bool --set /desktop/gnome/url-handlers/mailto/needs_terminal 1

# Revelation
gconftool-2 --type bool --set /apps/revelation/file/autoload 1
gconftool-2 --type string --set /apps/revelation/file/autoload_file "sftp://devilkin@mojave/home/devilkin/config/accounts.data"
gconftool-2 --type bool --set /apps/revelation/view/passwords 1
gconftool-2 --type bool --set /apps/revelation/view/passwords 0
gconftool-2 --type bool --set /apps/revelation/view/searchbar 1

# Rhythmbox
gconftool-2 --type string --set /apps/rhythmbox/library_layout_filename "%ta - %tt" 
gconftool-2 --type string --set /apps/rhythmbox/library_layout_path "%aa - %at" 
gconftool-2 --type list --list-type string --set /apps/rhythmbox/library_locations ["file:///home/dallen/media/music"]
gconftool-2 --type bool --set /apps/rhythmbox/sharing/enable_browsing 1
gconftool-2 --type int --set /apps/rhythmbox/ui/library/browser_views 1

# X-chat
#gconftool-2 --type string --set /apps/xchat/irc/nickname "mojavelinux"
#gconftool-2 --type string --set /apps/xchat/irc/realname "Dan Allen"
