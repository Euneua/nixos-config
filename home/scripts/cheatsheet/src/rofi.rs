// home/scripts/cheatsheet/src/rofi.rs
// Formats keybinds and launches Rofi in dmenu mode.

use std::fmt::Write;
use std::process::{Command, Stdio};
use std::io::Write as IoWrite;

use crate::parser::Keybind;

// ── Constants ─────────────────────────────────────────────────────────────────

const ROFI_THEME: &str = "/etc/nixos/home/rofi/cheatsheet.rasi";

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
        writeln!(out, "{:<40} {}", entry.keys, entry.desc).ok();
    }

    out
}
