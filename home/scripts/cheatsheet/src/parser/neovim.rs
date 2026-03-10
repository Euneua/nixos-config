// home/scripts/cheatsheet/src/parser/neovim.rs
// Parses keybinds from /etc/nixos/home/nvim/lua/keymaps.lua.

use regex::Regex;
use super::Keybind;

// ── Constants ─────────────────────────────────────────────────────────────────

const KEYMAPS_PATH: &str = "/etc/nixos/home/nvim/lua/keymaps.lua";

// ── Parser ────────────────────────────────────────────────────────────────────

pub fn parse() -> Vec<Keybind> {
    let content = match std::fs::read_to_string(KEYMAPS_PATH) {
        Ok(c)  => c,
        Err(_) => return vec![],
    };

    // Matches: map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
    let re = Regex::new(r#"map\("[^"]*",\s*"([^"]+)",\s*"[^"]*",\s*\{[^}]*desc\s*=\s*"([^"]+)""#).unwrap();

    re.captures_iter(&content)
        .map(|cap| {
            let keys = cap[1].trim()
                .replace("<leader>", "Space + ")
                .replace("<cmd>", "")
                .replace("<cr>", "");

            let desc = cap[2].trim().to_string();

            Keybind {
                category: "Neovim",
                keys,
                desc,
            }
        })
        .collect()
}
