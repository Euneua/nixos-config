// home/scripts/cheatsheet/src/main.rs
// Entry point – parses CLI arguments and launches the Rofi overlay.

mod parser;
mod rofi;

use clap::{Parser, ValueEnum};

// ── CLI ───────────────────────────────────────────────────────────────────────

#[derive(Parser)]
#[command(name = "cheatsheet", about = "Keybind cheatsheet via Rofi")]
struct Cli {
    /// Which category to show (default: all)
    #[arg(short, long, default_value = "all")]
    category: Category,
}

#[derive(ValueEnum, Clone)]
enum Category {
    All,
    Hyprland,
    Neovim,
    Browser,
}

// ── Main ──────────────────────────────────────────────────────────────────────

fn main() {
    let cli = Cli::parse();

    let entries = parser::load(&cli.category);
    rofi::show(entries);
}
