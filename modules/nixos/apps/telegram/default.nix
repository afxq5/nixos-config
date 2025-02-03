{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.telegram;
in {
  options.afxq.apps.telegram = with types; {
    enable = mkBoolOpt false "Whether or not to enable telegram.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ tdlib tdesktop ];
  };
}
