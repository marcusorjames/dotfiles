-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 1
local omarchy_monitor_scale = 1.25

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
-- Any external monitor (DP-1, DP-2, DP-3, ...) is placed to the left of eDP-1.
hl.monitor({ output = "", mode = "preferred", position = "auto-left", scale = "auto" })

-- Configure a specific monitor.
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = "auto" })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
