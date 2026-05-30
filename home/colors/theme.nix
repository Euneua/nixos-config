# home/colors/theme.nix
let
  active = "vesper";
  themes = {
    vesper = import ./colors-vesper.nix;
    ember  = import ./colors-ember.nix;
  };
in themes.${active}
