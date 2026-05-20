-- binds/media.lua

local locked = { locked = true }
local repeat_ = { locked = true, repeating = true }

-- ── Volume ────────────────────────────────────────────────────────────────────
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), repeat_)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      repeat_)
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     locked)
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   locked)

-- ── Brightness ────────────────────────────────────────────────────────────────
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), repeat_)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), repeat_)

-- ── Playback ──────────────────────────────────────────────────────────────────
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        locked)
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),  locked)
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),  locked)
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    locked)
