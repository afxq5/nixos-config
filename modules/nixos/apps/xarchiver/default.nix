{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.xarchiver;
in {
  options.afxq.apps.xarchiver = with types; {
    enable = mkBoolOpt false "Whether or not to enable xarchiver.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ xarchiver ]; };
}
