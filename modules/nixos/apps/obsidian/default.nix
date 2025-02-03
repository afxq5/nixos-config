{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.obsidian;
in {
  options.afxq.apps.obsidian = with types; {
    enable = mkBoolOpt false "Whether or not to enable obsidian.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; with pkgs.afxq; [ obsidian ];
  };
}
