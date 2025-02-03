{ options, inputs, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.ags;
in {
  options.afxq.apps.ags = with types; {
    enable = mkBoolOpt false "Whether or not to enable i3.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ inputs.ags.packages.${pkgs.system}.ags ];
  };
}
