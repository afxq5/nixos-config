{ options, config, pkgs, lib, ... }:

with lib;
with lib.afxq;
let
  cfg = config.afxq.desktop.addons.wallpapers;
  inherit (pkgs.afxq) wallpapers;
in
{
  options.afxq.desktop.addons.wallpapers = with types; {
    enable = mkBoolOpt false
      "Whether or not to add wallpapers to ~/Pictures/wallpapers.";
  };

  config = {
    afxq.home.file = lib.foldl
      (acc: name:
        let wallpaper = wallpapers.${name};
        in acc // {
          "Pictures/wallpapers/${wallpaper.fileName}".source = wallpaper;
        })
      { }
      (wallpapers.names);
  };
}
