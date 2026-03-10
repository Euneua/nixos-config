// home/scripts/cheatsheet/src/parser/hyprland.rs
// Parses keybinds from /etc/nixos/home/hypr/hyprland/keybinds.nix.

use regex::Regex;
use super::Keybind;

// ── Constants ─────────────────────────────────────────────────────────────────

const KEYBINDS_PATH: &str = "/etc/nixos/home/hypr/hyprland/keybinds.nix";

// ── Parser ────────────────────────────────────────────────────────────────────

pub fn parse() -> Vec<Keybind> {
    let content = match std::fs::read_to_string(KEYBINDS_PATH) {
        Ok(c)  => c,
        Err(_) => return vec![],
    };

    // Matches: "$mod, Return, exec, ghostty"
    // or:      "$mod SHIFT, h, movewindow, l"
    let re = Regex::new(r#""(\$mod[^,]*),\s*([^,]+),\s*([^,]+),?\s*([^"]*)""#).unwrap();

    re.captures_iter(&content)
        .map(|cap| {
            let modifier = cap[1].trim().replace("$mod", "Super");
            let key      = cap[2].trim().to_string();
            let action   = cap[3].trim().to_string();
            let arg      = cap[4].trim().to_string();

            let desc = if arg.is_empty() {
                action.clone()
            } else {
                format!("{} {}", action, arg)
            };

            Keybind {
                category: "Hyprland",
                keys:     format!("{} + {}", modifier, key),
                desc,
            }
        })
        .collect()
}
