# home/colors/colors-vesper.nix
# Vesper – warm dark base, lavender + beige accents.
# To switch themes: home/colors/theme.nix

let p = {
  # ── Base ──────────────────────────────────────────────────────────────────────
  crust    = "110f0d"; # deepest background, shadows
  mantle   = "1a1714"; # dimmed background
  base     = "211e1a"; # main background
  surface0 = "2c2925"; # inactive elements
  surface1 = "38342f"; # slightly elevated
  surface2 = "47433d"; # borders, separators

  # ── Text ──────────────────────────────────────────────────────────────────────
  overlay0 = "5c5751"; # very muted
  overlay1 = "716b64"; # muted
  overlay2 = "8a837b"; # dimmed
  subtext0 = "a89f96"; # secondary text
  subtext1 = "c4bab0"; # slightly prominent secondary
  text     = "e2d9ce"; # primary text

  # ── Primary Accent ────────────────────────────────────────────────────────────
  accent   = "cfc5f5"; # main accent – lavender
  accent2  = "b5a8e8"; # mid accent – mauve
  accent3  = "9b8fd4"; # dim accent – iris

  # ── Secondary Accent ──────────────────────────────────────────────────────────
  accent_b  = "e8c99a"; # secondary accent – beige
  accent_b2 = "c09060"; # dim secondary accent – wheat

  # ── Semantic ──────────────────────────────────────────────────────────────────
  error   = "e08080"; # error
  error2  = "c06868"; # secondary error
  warning = "d49555"; # warning
  caution = "d4be70"; # caution
  success = "8abf78"; # success
  info    = "78bfb0"; # info
  info2   = "a5d4cc"; # subtle info
  link    = "88aae0"; # links, references
  link2   = "7898d0"; # secondary link

  # ── Decorative ────────────────────────────────────────────────────────────────
  extra1 = "edd8cc";
  extra2 = "e0a0a0";
  extra3 = "d8c0f0";

  # ── Syntax ────────────────────────────────────────────────────────────────────
  syn_keyword     = "cfc5f5"; # if, for, return, fn, let ...
  syn_func        = "e8c99a"; # function definitions
  syn_func_call   = "d4c8f0"; # function calls
  syn_type        = "c09060"; # types, structs, classes
  syn_string      = "8abf78"; # strings, chars
  syn_number      = "d4be70"; # numbers, floats, booleans
  syn_operator    = "8a837b"; # + - * / = ...
  syn_punctuation = "5c5751"; # () {} [] , ; .
  syn_comment     = "716b64"; # comments
  syn_constant    = "a5d4cc"; # constants, enums
  syn_attribute   = "c09060"; # decorators, annotations
  syn_namespace   = "a89f96"; # modules, namespaces

  # ── Markdown ──────────────────────────────────────────────────────────────────
  syn_md_h1          = "cfc5f5"; # heading 1
  syn_md_h2          = "b5a8e8"; # heading 2
  syn_md_h3          = "9b8fd4"; # heading 3
  syn_md_h4          = "8a837b"; # heading 4
  syn_md_code        = "e8c99a"; # inline code foreground
  syn_md_code_bg     = "2c2925"; # inline code background
  syn_md_quote       = "716b64"; # blockquotes
  syn_md_list        = "b5a8e8"; # list bullets
  syn_md_bold        = "e2d9ce"; # **bold**
  syn_md_italic      = "c4bab0"; # *italic*
  syn_md_link        = "cfc5f5"; # [text](url) – label
  syn_md_url         = "88aae0"; # [text](url) – url
  syn_md_hr          = "47433d"; # horizontal rule
  syn_md_checkbox_on = "8abf78"; # - [x] checked
  syn_md_checkbox_off= "5c5751"; # - [ ] unchecked
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
  crust-rgb    = "17, 15, 13";
  mantle-rgb   = "26, 23, 20";
  base-rgb     = "33, 30, 26";
  surface0-rgb = "44, 41, 37";
  surface1-rgb = "56, 52, 47";
  surface2-rgb = "71, 67, 61";
  overlay0-rgb = "92, 87, 81";
  overlay1-rgb = "113, 107, 100";
  overlay2-rgb = "138, 131, 123";
  text-rgb     = "226, 217, 206";
  accent-rgb   = "207, 197, 245";
  accent2-rgb  = "181, 168, 232";
  accent_b-rgb = "232, 201, 154";
  error-rgb    = "224, 128, 128";
  warning-rgb  = "212, 149, 85";
  caution-rgb  = "212, 190, 112";
  success-rgb  = "138, 191, 120";
  info-rgb     = "120, 191, 176";
  link-rgb     = "136, 170, 224";

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
