# firefox/firefox.nix
# Firefox browser configuration via Home Manager.
# Includes enterprise policies, privacy hardening, extensions and UI tweaks.
# Extensions are installed declaratively – no manual setup needed.

{ config, pkgs, inputs, ... }:
{
  programs.firefox = {
    enable = true;

    # Enterprise policies: applied system-wide, cannot be overridden by the user
    policies = {
      # Disable telemetry and data collection
      DisableTelemetry       = true;
      DisableFirefoxStudies  = true;

      # Disable Pocket (Firefox's built-in read-later service)
      DisablePocket = true;

      # Allow Firefox account sync
      DisableFirefoxAccounts = false;

      # Hide the bookmarks toolbar by default
      DisplayBookmarksToolbar = "never";

      # Disable the built-in password manager (using Bitwarden instead)
      OfferToSaveLogins = false;

      # Use the built-in dark theme
      DefaultThemeType = "dark";
    };

    profiles.jannick = {
      isDefault = true;

      # Set Brave Search as default search engine (no extension needed)
      search = {
        default = "Brave";
        force   = true;
        engines = {
          "Brave" = {
            urls = [{ template = "https://search.brave.com/search?q={searchTerms}"; }];
            icon = "https://brave.com/static-assets/images/cropped-brave_appicon_release-32x32.png";
            definedAliases = [ "@brave" ];
          };
        };
      };

      # Extensions installed declaratively via Nix - no manual installation needed
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin           # Ad and tracker blocker
        bitwarden               # Password manager
        vimium                  # Vim keybinds in the browser
        darkreader              # Dark mode for sites without native dark theme
        return-youtube-dislikes # Restore the YouTube dislike count
      ];

      settings = {
        # Use the XDG desktop portal for file pickers (better Wayland integration)
        "widget.use-xdg-desktop-portal.file-picker" = 1;

        # Tell websites to use their own native dark theme
        "ui.systemUsesDarkTheme" = 1;

        # Privacy: block trackers and social media trackers
        "privacy.trackingprotection.enabled"                = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;

        # Disable hyperlink ping tracking
        "browser.send_pings" = false;

        # Disable speculative connections (pre-connects to URLs before you click)
        "browser.urlbar.speculativeConnect.enabled" = false;

        # Clear cookies and cache on shutdown
        "privacy.clearOnShutdown.cookies" = true;
        "privacy.clearOnShutdown.cache"   = true;

        # Force HTTPS everywhere
        "dom.security.https_only_mode" = true;

        # Disable WebRTC to prevent IP leaks
        "media.peerconnection.enabled" = false;

        # DNS over HTTPS via Cloudflare for encrypted DNS queries
        "network.trr.mode" = 2;
        "network.trr.uri"  = "https://mozilla.cloudflare-dns.com/dns-query";

        # UI: draw tabs in the titlebar, enable compact mode
        "browser.tabs.drawInTitlebar" = true;
        "browser.compactmode.show"    = true;
        "browser.uidensity"           = 1;

        # Firefox UI font
        "font.name.monospace.x-western"  = "JetBrainsMono Nerd Font";
        "font.name.sans-serif.x-western" = "JetBrainsMono Nerd Font";

        # Allow custom CSS stylesheets in the Firefox profile
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Open a blank page on startup and new tabs
        "browser.startup.homepage"   = "about:blank";
        "browser.newtabpage.enabled" = false;

        # Disable annoying popups and hints
        "browser.shell.checkDefaultBrowser"                  = false;
        "browser.startup.homepage_override.mstone"           = "ignore";
        "extensions.getAddons.showPane"                      = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;

        # Close tab goes back to previous tab instead of the one to the right
        "browser.tabs.selectOwnerOnClose" = true;

        # Disable warning when closing multiple tabs
        "browser.tabs.warnOnClose" = false;

        # Performance: enable WebRender for GPU accelerated rendering
        "gfx.webrender.all" = true;

        # Enable hardware video decoding via VA-API (Intel GPU)
        "media.ffmpeg.vaapi.enabled" = true;

        # Set Firefox UI language to English for better error message searchability
        "intl.accept_languages" = "en-US, en";
      };
    };
  };
}
