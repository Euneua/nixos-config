# home/apps/zen.nix
# Zen Browser configuration via Home Manager.
# Includes enterprise policies, privacy hardening (Librewolf-inspired),
# extensions and search engine configuration.
# Extensions are installed declaratively via ExtensionSettings policy –
# no manual setup needed, no firefox-addons input required.

{ config, pkgs, inputs, ... }:
let
  colors = import ../colors/theme.nix;
  r = colors.roles;

  mkExtension = guid: shortName: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${shortName}/latest.xpi";
      installation_mode = "force_installed";
    };
  };
in
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable              = true;
    setAsDefaultBrowser = true;

    policies = {

      # ── Telemetry & Data Collection ─────────────────────────────────────
      DisableTelemetry          = true;  # No usage data sent to Mozilla/Zen
      DisableFirefoxStudies     = true;  # No A/B tests or experiments
      DisableRemoteImprovements = true;  # No remote configuration changes
      DisableSystemAddonUpdate  = true;  # No automatic system addon updates
      DisableFeedbackCommands   = true;  # Remove feedback entries from Help menu

      # ── Account & Sync ──────────────────────────────────────────────────
      DisableFirefoxAccounts = true;  # Disable Mozilla account / sync
      DisableAppUpdate       = true;  # Zen can't self-update via Nix anyway

      # ── UI Cleanup ──────────────────────────────────────────────────────
      DisablePocket           = true;   # Remove Pocket integration
      NoDefaultBookmarks      = true;   # No Mozilla default bookmarks
      DisplayBookmarksToolbar = "never";
      OfferToSaveLogins       = false;  # Bitwarden handles passwords
      DisableFormHistory      = false;  # Keep form history

      # ── Security ────────────────────────────────────────────────────────
      SSLVersionMin = "tls1.2";         # Disable TLS 1.0 and 1.1
      HttpsOnlyMode = "force_enabled";  # HTTPS everywhere

      EnableTrackingProtection = {
        Value          = true;
        Locked         = true;
        Cryptomining   = true;  # Block cryptomining scripts
        Fingerprinting = true;  # Block fingerprinting scripts
        EmailTracking  = true;  # Block email tracking pixels
      };

      # ── DNS over HTTPS ──────────────────────────────────────────────────
      DNSOverHTTPS = {
        Enabled     = true;
        ProviderURL = "https://mozilla.cloudflare-dns.com/dns-query";
        Locked      = false;
        Fallback    = false;  # No fallback to plain DNS
      };

      # ── Cookies ─────────────────────────────────────────────────────────
      Cookies = {
        Behavior                = "reject-foreign";  # No third-party cookies
        BehaviorPrivateBrowsing = "reject-foreign";
      };

      # ── Permissions ─────────────────────────────────────────────────────
      Permissions = {
        Camera        = { BlockNewRequests = false; };
        Microphone    = { BlockNewRequests = false; };
        Location      = { BlockNewRequests = true;  };  # Block location by default
        Notifications = { BlockNewRequests = true;  };  # Block notifications by default
        Autoplay      = { Default = "block-audio-video"; };
      };

      # ── Developer Tools ─────────────────────────────────────────────────
      DisableDeveloperTools = false;

      # ── Extensions ──────────────────────────────────────────────────────
      ExtensionSettings = builtins.listToAttrs [
        (mkExtension "uBlock0@raymondhill.net"                 "ublock-origin")
        (mkExtension "{446900e4-71c2-419f-a6a7-df9c091e268b}" "bitwarden-password-manager")
        (mkExtension "{d7742d87-e61d-4b78-b8a1-b469842139fa}" "vimium-ff")
        (mkExtension "addon@darkreader.org"                    "darkreader")
        (mkExtension "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" "return-youtube-dislikes")
        (mkExtension "gdpr@cavi.au.dk"                        "consent-o-matic")
        (mkExtension "{b86e4813-687a-43a6-af91-6d0c3251e64b}" "localcdn-fork-of-decentraleyes")
        (mkExtension "{74145f27-f039-47ce-a470-a662b129930a}" "clearurls")
      ];

      # ── Search ──────────────────────────────────────────────────────────
      SearchEngines = {
        Default         = "Brave";
        PreventInstalls = true;
        Add = [
          {
            Name        = "Brave";
            URLTemplate = "https://search.brave.com/search?q={searchTerms}";
            Method      = "GET";
            IconURL     = "https://brave.com/static-assets/images/cropped-brave_appicon_release-32x32.png";
            Alias       = "@brave";
          }
        ];
      };
    };

    profiles.default = {
      isDefault = true;

      settings = {
        # ── Wayland ───────────────────────────────────────────────────────
        "widget.use-xdg-desktop-portal.file-picker" = 1;

        # ── UI ────────────────────────────────────────────────────────────
        "ui.systemUsesDarkTheme"      = 1;
        "browser.tabs.drawInTitlebar" = true;
        "browser.compactmode.show"    = true;
        "browser.uidensity"           = 1;
        "font.name.monospace.x-western" = "JetBrainsMono Nerd Font";

        # ── Startup ───────────────────────────────────────────────────────
        "browser.startup.homepage"   = "about:blank";
        "browser.newtabpage.enabled" = false;

        # ── Annoyances ────────────────────────────────────────────────────
        "browser.shell.checkDefaultBrowser"                  = false;
        "browser.startup.homepage_override.mstone"           = "ignore";
        "extensions.getAddons.showPane"                      = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.tabs.selectOwnerOnClose"                    = true;
        "browser.tabs.warnOnClose"                           = false;

        # ── Privacy ───────────────────────────────────────────────────────
        "privacy.trackingprotection.enabled"                = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.trackingprotection.cryptomining.enabled"   = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.emailtracking.enabled"  = true;
        "privacy.resistFingerprinting"                      = true;
        "browser.send_pings"                                = false;
        "browser.urlbar.speculativeConnect.enabled"         = false;
        "dom.security.https_only_mode"                      = true;
        "network.http.referer.XOriginPolicy"                = 2;  # Only send referrer to same origin
        "network.http.referer.XOriginTrimmingPolicy"        = 2;  # Trim to origin only

        # ── Security ──────────────────────────────────────────────────────
        "security.ssl.require_safe_negotiation"        = true;
        "security.tls.enable_0rtt_data"               = false;  # Prevent replay attacks
        "security.OCSP.require"                        = true;   # Require certificate validation
        "security.mixed_content.block_active_content"  = true;
        "security.mixed_content.block_display_content" = true;
        "dom.disable_window_open_feature.status"       = true;

        # ── Telemetry ─────────────────────────────────────────────────────
        "toolkit.telemetry.unified"                    = false;
        "toolkit.telemetry.enabled"                    = false;
        "toolkit.telemetry.server"                     = "data:,";
        "toolkit.telemetry.archive.enabled"            = false;
        "toolkit.telemetry.newProfilePing.enabled"     = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled"         = false;
        "toolkit.telemetry.bhrPing.enabled"            = false;
        "toolkit.telemetry.firstShutdownPing.enabled"  = false;
        "datareporting.healthreport.uploadEnabled"     = false;
        "datareporting.policy.dataSubmissionEnabled"   = false;
        "app.shield.optoutstudies.enabled"             = false;
        "browser.discovery.enabled"                    = false;

        # ── Performance ───────────────────────────────────────────────────
        "gfx.webrender.all"          = true;  # GPU accelerated rendering
        "media.ffmpeg.vaapi.enabled" = true;  # Hardware video decoding via VA-API

        # ── Language ──────────────────────────────────────────────────────
        "intl.accept_languages" = "en-US, en";

        # ── Extensions ────────────────────────────────────────────────────
        "extensions.autoDisableScopes" = 0;  # Don't disable declaratively installed extensions

        # ── Zen – Appearance ──────────────────────────────────────────────
        "zen.theme.accent-color"          = "#${r.accent}";  # Sync accent with Nix theme
        "zen.watermark.enabled"           = false;           # No splash screen on start
        "zen.view.grey-out-inactive-windows" = true;         # Fade inactive windows to gray

        # ── Zen – Layout (Collapsed Sidebar) ──────────────────────────────
        "zen.view.compact.animate-sidebar"                  = true;   # Animate sidebar in/out
        "zen.view.compact.show-sidebar-and-toolbar-on-hover" = true;  # Show sidebar on hover
        "zen.view.compact.toolbar-hide-after-hover.duration" = 800;   # Hide after 800ms

        # ── Zen – Tabs ────────────────────────────────────────────────────
        "zen.tabs.dim-pending" = true;  # Dim unloaded tabs

        # ── Zen – URL Bar ─────────────────────────────────────────────────
        "zen.urlbar.show-protections-icon" = true;   # Show security info icon
        "zen.urlbar.replace-newtab"        = true;   # New tab opens URL bar directly
        "zen.urlbar.hide-one-offs"         = true;   # Hide alternative search engines

        # ── Zen – Glance ──────────────────────────────────────────────────
        "zen.glance.enable-contextmenu-search"    = true;  # Open links in Glance overlay
        "zen.glance.open-essential-external-links" = true; # External links open in Glance

        # ── Zen – Split View ──────────────────────────────────────────────
        "zen.splitView.enable-tab-drop" = true;  # Drag tab to center to start split view

        # ── Zen – Media ───────────────────────────────────────────────────
        "zen.mediacontrols.enabled"                                        = true;  # Media player in sidebar
        "media.videocontrols.picture-in-picture.enabled"                   = true;  # PiP support
        "media.videocontrols.picture-in-picture.enable-when-switching-tabs.enabled" = false;

        # ── Zen – Workspaces ──────────────────────────────────────────────
        "zen.workspaces.swipe-actions"          = true;   # Swipe on sidebar to switch workspace
        "zen.workspaces.wrap-around-navigation" = true;   # Wrap from last to first workspace
        "zen.workspaces.natural-scroll"         = false;  # No natural scroll for workspaces

        # ── Zen – Downloads ───────────────────────────────────────────────
        "zen.downloads.download-animation" = true;  # Animate downloads
      };
    };
  };
}
