# home/colors/colors-template.nix
# Template for creating a custom theme.
# Copy this file, rename it, fill in your hex values.
# Then add it to home/colors/theme.nix to activate it.
#
# Hex values without # prefix, e.g. "1e1e2e"
# RGB values as "r, g, b" strings for rgba() contexts, e.g. "30, 30, 46"

let p = {
  # ── Base ──────────────────────────────────────────────────────────────────────
  crust    = "000000"; # deepest background, shadows
  mantle   = "000000"; # dimmed background
  base     = "000000"; # main background
  surface0 = "000000"; # inactive elements
  surface1 = "000000"; # slightly elevated
  surface2 = "000000"; # borders, separators

  # ── Text ──────────────────────────────────────────────────────────────────────
  overlay0 = "000000"; # very muted
  overlay1 = "000000"; # muted
  overlay2 = "000000"; # dimmed
  subtext0 = "000000"; # secondary text
  subtext1 = "000000"; # slightly prominent secondary
  text     = "000000"; # primary text

  # ── Primary Accent ────────────────────────────────────────────────────────────
  accent   = "000000"; # main accent – active borders, highlights
  accent2  = "000000"; # mid accent – UI elements
  accent3  = "000000"; # dim accent – inactive states

  # ── Secondary Accent ──────────────────────────────────────────────────────────
  accent_b  = "000000"; # secondary accent
  accent_b2 = "000000"; # dim secondary accent

  # ── Semantic ──────────────────────────────────────────────────────────────────
  error   = "000000"; # error
  error2  = "000000"; # secondary error
  warning = "000000"; # warning
  caution = "000000"; # caution
  success = "000000"; # success
  info    = "000000"; # info
  info2   = "000000"; # subtle info
  link    = "000000"; # links, references
  link2   = "000000"; # secondary link

  # ── Decorative ────────────────────────────────────────────────────────────────
  extra1 = "000000";
  extra2 = "000000";
  extra3 = "000000";

  # ── Syntax ────────────────────────────────────────────────────────────────────
  syn_keyword     = "000000"; # if, for, return, fn, let ...
  syn_func        = "000000"; # function definitions
  syn_func_call   = "000000"; # function calls
  syn_type        = "000000"; # types, structs, classes
  syn_string      = "000000"; # strings, chars
  syn_number      = "000000"; # numbers, floats, booleans
  syn_operator    = "000000"; # + - * / = ...
  syn_punctuation = "000000"; # () {} [] , ; .
  syn_comment     = "000000"; # comments
  syn_constant    = "000000"; # constants, enums
  syn_attribute   = "000000"; # decorators, annotations
  syn_namespace   = "000000"; # modules, namespaces

  # ── Markdown ──────────────────────────────────────────────────────────────────
  syn_md_h1          = "000000"; # heading 1
  syn_md_h2          = "000000"; # heading 2
  syn_md_h3          = "000000"; # heading 3
  syn_md_h4          = "000000"; # heading 4
  syn_md_code        = "000000"; # inline code foreground
  syn_md_code_bg     = "000000"; # inline code background
  syn_md_quote       = "000000"; # blockquotes
  syn_md_list        = "000000"; # list bullets
  syn_md_bold        = "000000"; # **bold**
  syn_md_italic      = "000000"; # *italic*
  syn_md_link        = "000000"; # [text](url) – label
  syn_md_url         = "000000"; # [text](url) – url
  syn_md_hr          = "000000"; # horizontal rule
  syn_md_checkbox_on = "000000"; # - [x] checked
  syn_md_checkbox_off= "000000"; # - [ ] unchecked
}; in
{
  inherit (p)
    crust mantle base surface0 surface1 surface2
    overlay0 overlay1 overlay2 subtext0 subtext1 text
    accent accent2 accent3 accent_b accent_b2
    error error2 warning caution success info info2 link link2
    extra1 extra2 extra3
    syn_keyword syn_func syn_func_call syn_type syn_string
    syn_number syn_operator syn_punctuation syn_comment
    syn_constant syn_attribute syn_namespace
    syn_md_h1 syn_md_h2 syn_md_h3 syn_md_h4
    syn_md_code syn_md_code_bg syn_md_quote syn_md_list
    syn_md_bold syn_md_italic syn_md_link syn_md_url
    syn_md_hr syn_md_checkbox_on syn_md_checkbox_off;

  # ── RGB ───────────────────────────────────────────────────────────────────────
  crust-rgb    = "0, 0, 0";
  mantle-rgb   = "0, 0, 0";
  base-rgb     = "0, 0, 0";
  surface0-rgb = "0, 0, 0";
  surface1-rgb = "0, 0, 0";
  surface2-rgb = "0, 0, 0";
  overlay0-rgb = "0, 0, 0";
  overlay1-rgb = "0, 0, 0";
  overlay2-rgb = "0, 0, 0";
  text-rgb     = "0, 0, 0";
  accent-rgb   = "0, 0, 0";
  accent2-rgb  = "0, 0, 0";
  accent_b-rgb = "0, 0, 0";
  error-rgb    = "0, 0, 0";
  warning-rgb  = "0, 0, 0";
  caution-rgb  = "0, 0, 0";
  success-rgb  = "0, 0, 0";
  info-rgb     = "0, 0, 0";
  link-rgb     = "0, 0, 0";

  # ── Roles ─────────────────────────────────────────────────────────────────────
  roles = {
    accent        = p.accent;
    accent_dim    = p.accent3;
    accent_subtle = p.accent2;
    accent2       = p.accent_b;
    accent2_dim   = p.accent_b2;

    bg       = p.base;
    bg_dark  = p.crust;
    bg_dim   = p.mantle;
    surface  = p.surface0;
    surface1 = p.surface1;
    surface2 = p.surface2;

    border          = p.accent;
    border_inactive = p.surface2;

    text    = p.text;
    subtext = p.subtext1;
    muted   = p.overlay2;
    subtle  = p.overlay0;

    error   = p.error;
    error2  = p.error2;
    warning = p.warning;
    caution = p.caution;
    success = p.success;
    info    = p.info;
    info2   = p.info2;
    link    = p.link;
    link2   = p.link2;

    shadow = p.crust;

    # ── Syntax ──────────────────────────────────────────────────────────────────
    syn_keyword     = p.syn_keyword;
    syn_func        = p.syn_func;
    syn_func_call   = p.syn_func_call;
    syn_type        = p.syn_type;
    syn_string      = p.syn_string;
    syn_number      = p.syn_number;
    syn_operator    = p.syn_operator;
    syn_punctuation = p.syn_punctuation;
    syn_comment     = p.syn_comment;
    syn_constant    = p.syn_constant;
    syn_attribute   = p.syn_attribute;
    syn_namespace   = p.syn_namespace;

    # ── Markdown ────────────────────────────────────────────────────────────────
    syn_md_h1          = p.syn_md_h1;
    syn_md_h2          = p.syn_md_h2;
    syn_md_h3          = p.syn_md_h3;
    syn_md_h4          = p.syn_md_h4;
    syn_md_code        = p.syn_md_code;
    syn_md_code_bg     = p.syn_md_code_bg;
    syn_md_quote       = p.syn_md_quote;
    syn_md_list        = p.syn_md_list;
    syn_md_bold        = p.syn_md_bold;
    syn_md_italic      = p.syn_md_italic;
    syn_md_link        = p.syn_md_link;
    syn_md_url         = p.syn_md_url;
    syn_md_hr          = p.syn_md_hr;
    syn_md_checkbox_on = p.syn_md_checkbox_on;
    syn_md_checkbox_off= p.syn_md_checkbox_off;
  };
}
