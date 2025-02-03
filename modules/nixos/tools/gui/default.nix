{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.tools.gui;
in {
  options.afxq.tools.gui = with types; {
    enable = mkBoolOpt false "Whether or not to enable gui.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        baobab
        bleachbit
        gtk3
      ];
  };
}
