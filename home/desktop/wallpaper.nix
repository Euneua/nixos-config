# home/desktop/wallpaper.nix
# Wallpaper daemon (awww) + time-based wallpaper switcher.
# 10 Phasen basierend auf Sonnenaufgang/-untergang für Wedel.
{ config, pkgs, ... }:
let
  wallpaperDir = "${config.home.homeDirectory}/Pictures/wallpapers";

  wallpaperScript = pkgs.writeShellScriptBin "wallpaper-switch" ''
    WALLPAPER=$(${pkgs.python3.withPackages (ps: [ ps.astral ])}/bin/python3 -c "
from astral import LocationInfo
from astral.sun import sun
from datetime import date, datetime, timezone, timedelta

l = LocationInfo('Wedel', 'Germany', 'Europe/Berlin', 53.58, 9.69)
s = sun(l.observer, date=date.today())

sunrise = s['sunrise']
sunset  = s['sunset']
noon    = s['noon']
now     = datetime.now(timezone.utc).astimezone()

midnight_end  = sunrise - timedelta(hours=2, minutes=30)
predawn_end   = sunrise - timedelta(hours=1, minutes=15)
dawn_end      = sunrise - timedelta(minutes=15)
sunrise_end   = sunrise + timedelta(hours=1, minutes=30)
morning_end   = noon    - timedelta(minutes=30)
day_end       = sunset  - timedelta(hours=1, minutes=30)
dusk_end      = sunset  + timedelta(minutes=30)
evening_end   = sunset  + timedelta(hours=1, minutes=30)
night_end     = sunset  + timedelta(hours=3)
latenight_end = sunset  + timedelta(hours=5)

if now < midnight_end:
    phase = 'midnight'
elif now < predawn_end:
    phase = 'predawn'
elif now < dawn_end:
    phase = 'dawn'
elif now < sunrise_end:
    phase = 'sunrise'
elif now < morning_end:
    phase = 'morning'
elif now < day_end:
    phase = 'day'
elif now < dusk_end:
    phase = 'dusk'
elif now < evening_end:
    phase = 'evening'
elif now < night_end:
    phase = 'night'
elif now < latenight_end:
    phase = 'latenight'
else:
    phase = 'midnight'

print('${wallpaperDir}/wallpaper-' + phase + '.png')
")
    ${pkgs.awww}/bin/awww img "$WALLPAPER" \
      --transition-type fade \
      --transition-duration 7 \
      --transition-fps 60
  '';
in
{
  # ── awww Daemon ───────────────────────────────────────────────────────────
  systemd.user.services.awww = {
    Unit = {
      Description = "awww wallpaper daemon";
      After       = [ "graphical-session.target" ];
      PartOf      = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.awww}/bin/awww-daemon";
      Restart   = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  # ── Wallpaper Switch Service ──────────────────────────────────────────────
  systemd.user.services.wallpaper-switch = {
    Unit = {
      Description = "Switch wallpaper based on time of day";
      After       = [ "awww.service" ];
      Requires    = [ "awww.service" ];
    };
    Service = {
      Type      = "oneshot";
      ExecStart = "${wallpaperScript}/bin/wallpaper-switch";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  # ── Wallpaper Switch Timer ────────────────────────────────────────────────
  systemd.user.timers.wallpaper-switch = {
    Unit.Description = "Wallpaper-Wechsel alle 30 Minuten";
    Timer = {
      OnBootSec       = "5sec";
      OnUnitActiveSec = "30min";
      Unit            = "wallpaper-switch.service";
    };
    Install.WantedBy = [ "timers.target" ];
  };

  home.packages = [ wallpaperScript ];
}
