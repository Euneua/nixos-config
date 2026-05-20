# home/colors/theme.nix
let
  active = "vesper";
  themes = {
    vesper = import ./colors-vesper.nix;
  };
in themes.${active}
