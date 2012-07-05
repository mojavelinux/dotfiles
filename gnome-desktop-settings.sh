#!/bin/sh

# This script will initialize my personal desktop preferences on a fresh
# or existing installation of Linux running Gnome 3.

# Default values can be found in the schema files in /usr/share/glib-2.0/schemas

gsettings set org.gnome.settings-daemon.peripherals.keyboard delay 250
gsettings set org.gnome.settings-daemon.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.settings-daemon.peripherals.mouse locate-pointer true
gsettings set org.gnome.settings-daemon.peripherals.mouse middle-button-enabled true
gsettings set org.gnome.settings-daemon.peripherals.touchpad horiz-scroll-enabled true
gsettings set org.gnome.settings-daemon.peripherals.touchpad motion-acceleration 3
gsettings set org.gnome.settings-daemon.peripherals.touchpad motion-threshold 5
gsettings set org.gnome.settings-daemon.peripherals.touchpad scroll-method two-finger-scrolling
gsettings set org.gnome.settings-daemon.peripherals.touchpad tap-to-click true
gsettings set org.gnome.settings-daemon.plugins.updates auto-download-updates true
gsettings set org.gnome.settings-daemon.plugins.updates auto-update-type security
gsettings set org.gnome.settings-daemon.plugins.power idle-dim-battery false
gsettings set org.gnome.settings-daemon.plugins.power sleep-display-ac 1800
gsettings set org.gnome.settings-daemon.plugins.power sleep-display-battery 1800
gsettings set org.gnome.settings-daemon.plugins.power percentage-action -1
gsettings set org.gnome.settings-daemon.plugins.power percentage-critical -1
gsettings set org.gnome.settings-daemon.plugins.power percentage-low -1
gsettings set org.gnome.settings-daemon.plugins.power time-action 120
gsettings set org.gnome.settings-daemon.plugins.power time-critical 300
gsettings set org.gnome.settings-daemon.plugins.power time-low 600
gsettings set org.gnome.settings-daemon.plugins.power use-time-for-policy true
gsettings set org.gnome.settings-daemon.plugins.power critical-battery-action interactive
gsettings set org.gnome.GPaste max-displayed-history-size 19
gsettings set org.gnome.GPaste max-history-size 100
gsettings set org.gnome.GPaste primary-to-history true
gsettings set org.gnome.GPaste synchronize-clipboards true
gsettings set org.gnome.desktop.interface can-change-accels true
gsettings set org.gnome.desktop.interface clock-format 24h
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface cursor-blink false
gsettings set org.gnome.desktop.interface gtk-im-module gtk-im-context-simple
gsettings set org.gnome.desktop.interface show-input-method-menu false
gsettings set org.gnome.desktop.interface show-unicode-menu false
gsettings set org.gnome.desktop.interface icon-theme Faenza
gsettings set org.gnome.desktop.lockdown disable-user-switching true
gsettings set org.gnome.desktop.media-handling autorun-never true
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver user-switch-enabled false
gsettings set org.gnome.gedit.preferences.editor create-backup-copy false
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor insert-spaces true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor right-margin-position 120
gsettings set org.gnome.gedit.preferences.ui statusbar-visible true
gsettings set org.gnome.gedit.preferences.ui notebook-show-tabs-mode always
gsettings set org.gnome.libgnomekbd.keyboard options "['ctrl\tctrl:nocaps']"
gsettings set org.gnome.shell.clock show-date true
gsettings set org.gnome.nautilus.preferences click-policy single
gsettings set org.gnome.nautilus.preferences enable-delete true
gsettings set org.gnome.nautilus.preferences date-format iso
gsettings set org.gnome.nautilus.preferences default-folder-viewer list-view
gsettings set org.gnome.nautilus.compact-view all-columns-have-same-width true
gsettings set org.gnome.nautilus.compact-view default-zoom-level larger
gsettings set org.gnome.nautilus.icon-view captions "['none', 'none', 'none']"
gsettings set org.gnome.nautilus.icon-view default-zoom-level large
gsettings set org.gnome.nautilus.list-view default-column-order "['name', 'size', 'type', 'date_modified', 'permissions']"
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'type', 'date_modified', 'permissions']"
gsettings set org.gnome.nautilus.list-view default-zoom-level smaller
gsettings set org.gnome.nautilus.window-state side-pane-view places
gsettings set org.gnome.nautilus.window-state start-with-status-bar true
gsettings set org.gnome.nautilus.window-state start-with-sidebar true
