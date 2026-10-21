-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 1

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
-- Any external monitor (DP-1, DP-2, DP-3, ...) is placed to the left of eDP-1
-- and picks its own scale from its resolution/size ("auto"), so a 4K display
-- and a 1440p display each get a suitable scale.
hl.monitor({ output = "", mode = "preferred", position = "auto-left", scale = "auto" })

-- The laptop panel keeps its own fixed scale.
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1.25 })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
