{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.ventoy;
in {
  options.afxq.apps.ventoy = with types; {
    enable = mkBoolOpt false "Whether or not to enable i3.";
  };

  config = mkIf cfg.enable { environment.systemPackages = [ ventoy-full ]; };
}
