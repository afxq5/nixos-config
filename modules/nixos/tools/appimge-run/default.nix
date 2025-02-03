{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.tools.appimage-run;
in {
  options.afxq.tools.appimage-run = with types; {
    enable = mkBoolOpt false "Whether or not to enable appimage-run.";
  };

  config = mkIf cfg.enable {
    afxq.home.configFile."wgetrc".text = "";

    environment.systemPackages = with pkgs; [ appimage-run ];
  };
}
