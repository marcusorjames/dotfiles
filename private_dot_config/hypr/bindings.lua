-- Personal keybinding overrides. See current bindings with:
--   omarchy menu keybindings --print

local scripts = os.getenv("HOME") .. "/.config/hypr/scripts/"

local function rebind(keys, description, action)
  hl.unbind(keys)
  o.bind(keys, description, action)
end

-- Applications
rebind("SUPER + ALT + RETURN", "Tmux", [[uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" tmux new]])
rebind("SUPER + SHIFT + M", "Music", scripts .. [[toggle-special-workspace music && omarchy-launch-or-focus spotify "uwsm-app -- spotify --force-device-scale-factor=1.25"]])
rebind("SUPER + SHIFT + ALT + M", "Music Alt", scripts .. [[toggle-special-workspace music-alt && omarchy-launch-or-focus plexamp "uwsm-app -- plexamp"]])
rebind("SUPER + SHIFT + B", "Activity", "omarchy-launch-tui btop")
rebind("SUPER + SHIFT + D", "Docker", "omarchy-launch-tui lazydocker")
rebind("SUPER + SHIFT + O", "Obsidian", [[omarchy-launch-or-focus "^obsidian$" "uwsm-app -- obsidian"]])
rebind("SUPER + SHIFT + W", "Typora", "uwsm-app -- typora --enable-wayland-ime")
rebind("SUPER + SHIFT + SLASH", "Passwords", [[omarchy-launch-or-focus signal "uwsm-app -- bitwarden-desktop"]])
rebind("SUPER + SHIFT + T", "Tasks", "omarchy-launch-or-focus todoist")
rebind("SUPER + E", "Email", [[omarchy-launch-or-focus "uwsm-app -- /opt/wavebox.io/wavebox/wavebox-launcher"]])
rebind("SUPER + W", "Browser", "omarchy-launch-browser")
rebind("SUPER + SHIFT + R", "Reload Hyprland", [[hyprctl reload && notify-send "Hyprland reloaded" || notify-send "Failed to reload Hyprland"]])

-- Web apps
rebind("SUPER + SHIFT + A", "Gemini", [[omarchy-launch-or-focus-webapp Gemini "https://gemini.google.com/"]])
rebind("SUPER + SHIFT + ALT + A", "Claude", [[omarchy-launch-or-focus-webapp Claude "https://claude.ai"]])
rebind("SUPER + SHIFT + S", "Slack", scripts .. [[toggle-special-workspace slack && omarchy-launch-or-focus-webapp Slack "https://bolder-org.slack.com"]])
rebind("SUPER + SHIFT + C", "WhatsApp", scripts .. [[toggle-special-workspace whatsapp && omarchy-launch-or-focus-webapp WhatsApp "https://web.whatsapp.com/"]])
rebind("SUPER + ALT + SHIFT + C", "Discord", scripts .. [[toggle-special-workspace discord && omarchy-launch-or-focus-webapp Discord "https://discord.com/channels/@me"]])
rebind("SUPER + SHIFT + CTRL + G", "Google Messages", [[omarchy-launch-or-focus-webapp "Google Messages" "https://messages.google.com/web/conversations"]])

-- Windows
rebind("SUPER + H", "Focus left", hl.dsp.focus({ direction = "l" }))
rebind("SUPER + J", "Focus down", hl.dsp.focus({ direction = "d" }))
rebind("SUPER + K", "Focus up", hl.dsp.focus({ direction = "u" }))
rebind("SUPER + L", "Focus right", hl.dsp.focus({ direction = "r" }))
rebind("SUPER + SHIFT + K", "Keybindings", "omarchy-menu-keybindings")
rebind("SUPER + SHIFT + J", "Toggle window split", hl.dsp.layout("togglesplit"))
rebind("SUPER + Q", "Hide scratchpad", scripts .. "hide-scratchpad")
o.bind("SUPER + SHIFT + Q", "Close window", hl.dsp.window.close())
rebind("SUPER + TAB", "Focus current or last window", hl.dsp.focus({ last = true }))
o.bind("SUPER + SHIFT + L", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")

-- Resize (SUPER + ALT + -/=)
rebind("SUPER + ALT + code:20", "Shrink window up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
rebind("SUPER + ALT + code:21", "Expand window down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

-- Media
rebind("SUPER + SHIFT + P", "Pause", "omarchy-shell media playPause")
rebind("SUPER + SHIFT + code:21", "Volume up precise", "omarchy-audio-output-volume +1")
rebind("SUPER + SHIFT + code:20", "Volume down precise", "omarchy-audio-output-volume -1")
rebind("SUPER + SHIFT + period", "Next track", "omarchy-shell media next")
rebind("SUPER + SHIFT + comma", "Previous track", "omarchy-shell media previous")
