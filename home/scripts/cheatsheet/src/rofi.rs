// home/scripts/cheatsheet/src/rofi.rs
// Formats keybinds and launches Rofi in dmenu mode.
// Prefix colors are injected at compile time from colors.nix via default.nix.

use std::fmt::Write;
use std::process::{Command, Stdio};
use std::io::Write as IoWrite;

use crate::parser::Keybind;

// ── Constants ─────────────────────────────────────────────────────────────────

const ROFI_THEME: &str = "/home/jannick/.config/rofi/cheatsheet.rasi";

// Colors injected at compile time from colors.nix via default.nix
const COLOR_HYPRLAND: &str = env!("CHEATSHEET_COLOR_HYPRLAND");
const COLOR_NEOVIM:   &str = env!("CHEATSHEET_COLOR_NEOVIM");
const COLOR_BROWSER:  &str = env!("CHEATSHEET_COLOR_BROWSER");
const COLOR_UNKNOWN:  &str = env!("CHEATSHEET_COLOR_UNKNOWN");

// ── Public API ────────────────────────────────────────────────────────────────

pub fn show(entries: Vec<Keybind>) {
    let input = format_entries(&entries);

    let mut child = Command::new("rofi")
        .args([
            "-dmenu",
            "-i",
            "-p", "keybinds",
            "-theme", ROFI_THEME,
        ])
        .stdin(Stdio::piped())
        .spawn()
        .expect("Failed to launch rofi");

    if let Some(stdin) = child.stdin.as_mut() {
        stdin.write_all(input.as_bytes()).ok();
    }

    child.wait().ok();
}

// ── Helpers ───────────────────────────────────────────────────────────────────

fn format_entries(entries: &[Keybind]) -> String {
    let mut out = String::new();

    for entry in entries {
        let prefix = match entry.category {
            "Hyprland" => format!("<span color=\"{}\">[H]</span>", COLOR_HYPRLAND),
            "Neovim"   => format!("<span color=\"{}\">[N]</span>", COLOR_NEOVIM),
            "Browser"  => format!("<span color=\"{}\">[B]</span>", COLOR_BROWSER),
            _          => format!("<span color=\"{}\">[?]</span>", COLOR_UNKNOWN),
        };

        writeln!(out, "{} {:<40} {}", prefix, entry.keys, entry.desc).ok();
    }

    out
}
