// home/scripts/cheatsheet/src/parser/mod.rs
// Parser module – exposes load() which collects keybinds from all sources.

mod hyprland;
mod neovim;

use crate::Category;

// ── Types ─────────────────────────────────────────────────────────────────────

pub struct Keybind {
    pub category: &'static str,
    pub keys:     String,
    pub desc:     String,
}

// ── Public API ────────────────────────────────────────────────────────────────

pub fn load(category: &Category) -> Vec<Keybind> {
    let mut entries = Vec::new();

    match category {
        Category::All => {
            entries.extend(hyprland::parse());
            entries.extend(neovim::parse());
        }
        Category::Hyprland => entries.extend(hyprland::parse()),
        Category::Neovim   => entries.extend(neovim::parse()),
        Category::Browser  => {} // TODO
    }

    entries
}
