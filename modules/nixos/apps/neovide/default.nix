{ options, lib, config, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.neovide;
in {
  options.afxq.apps.neovide = with types; {
    enable = mkBoolOpt false "Whether or not to enable newvide.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ neovide ]; };
}
