{ lib, config, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.cli-apps.dmenu;
in {
  options.afxq.cli-apps.dmenu = with types; {
    enable = mkBoolOpt false "Whether or not to enable neovim.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ dmenu ]; };
}
