-- Personal per-app window rules.
local full_float = { float = true, size = "(monitor_w*0.9) (monitor_h*0.9)" }

o.window({ tag = "full-float" }, full_float)
o.window("^([bB]itwarden)$", { tag = "+full-float" })
o.window("^([tT]odoist)$", { tag = "+full-float" })
o.window("^([wW]avebox)$", { tag = "+full-float" })
o.window("^plexamp$", { workspace = "special:music-alt silent" })
