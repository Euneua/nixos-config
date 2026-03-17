# home/apps/firefox.nix
# Firefox browser configuration via Home Manager.
# Includes enterprise policies, privacy hardening, extensions and UI tweaks.
# Extensions are installed declaratively – no manual setup needed.

{ config, pkgs, inputs, ... }:
{
  programs.firefox = {
    enable = true;

    # Enterprise policies: applied system-wide, cannot be overridden by the user
    policies = {
      DisableTelemetry       = true;
      DisableFirefoxStudies  = true;
      DisablePocket          = true;
      DisableFirefoxAccounts = false;
      DisplayBookmarksToolbar = "never";
      OfferToSaveLogins      = false;
      DefaultThemeType       = "dark";
    };

    profiles.jannick = {
      isDefault = true;

      # Set Brave Search as default search engine (no extension needed)
      search = {
        default = "Brave";
        force   = true;
        engines = {
          "Brave" = {
            urls           = [{ template = "https://search.brave.com/search?q={searchTerms}"; }];
            icon           = "https://brave.com/static-assets/images/cropped-brave_appicon_release-32x32.png";
            definedAliases = [ "@brave" ];
          };
        };
      };

      # Extensions installed declaratively – no manual installation needed
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin            # Ad and tracker blocker
        bitwarden                # Password manager
        vimium                   # Vim keybinds in the browser
        darkreader               # Dark mode for sites without native dark theme
        return-youtube-dislikes  # Restore the YouTube dislike count
      ];

      settings = {
        # ── Wayland ───────────────────────────────────────────────────────────
        "widget.use-xdg-desktop-portal.file-picker" = 1;  # XDG file picker

        # ── Theme ─────────────────────────────────────────────────────────────
        "ui.systemUsesDarkTheme" = 1;

        # ── Privacy ───────────────────────────────────────────────────────────
        "privacy.trackingprotection.enabled"                = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "browser.send_pings"                                = false;
        "browser.urlbar.speculativeConnect.enabled"         = false;
        "privacy.clearOnShutdown.cookies"                   = true;
        "privacy.clearOnShutdown.cache"                     = true;
        "dom.security.https_only_mode"                      = true;
        "media.peerconnection.enabled"                      = false;  # Disable WebRTC (IP leak prevention)

        # ── DNS over HTTPS ────────────────────────────────────────────────────
        "network.trr.mode" = 2;
        "network.trr.uri"  = "https://mozilla.cloudflare-dns.com/dns-query";

        # ── UI ────────────────────────────────────────────────────────────────
        "browser.tabs.drawInTitlebar"  = true;
        "browser.compactmode.show"     = true;
        "browser.uidensity"            = 1;
        "font.name.monospace.x-western"  = "JetBrainsMono Nerd Font";
        "font.name.sans-serif.x-western" = "JetBrainsMono Nerd Font";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # ── Startup ───────────────────────────────────────────────────────────
        "browser.startup.homepage"   = "about:blank";
        "browser.newtabpage.enabled" = false;

        # ── Annoyances ────────────────────────────────────────────────────────
        "browser.shell.checkDefaultBrowser"                  = false;
        "browser.startup.homepage_override.mstone"           = "ignore";
        "extensions.getAddons.showPane"                      = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.tabs.selectOwnerOnClose"                    = true;  # Go to previous tab on close
        "browser.tabs.warnOnClose"                           = false;

        # ── Performance ───────────────────────────────────────────────────────
        "gfx.webrender.all"          = true;   # GPU accelerated rendering
        "media.ffmpeg.vaapi.enabled" = true;   # Hardware video decoding via VA-API (Intel GPU)

        # ── Language ──────────────────────────────────────────────────────────
        "intl.accept_languages" = "en-US, en";  # English for better error searchability
      };
    };
  };
}