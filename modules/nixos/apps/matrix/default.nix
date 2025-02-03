{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.matrix;
in {
  options.afxq.apps.matrix = with types; {
    enable = mkBoolOpt false "Whether or not to enable Matrix.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ element-desktop ];
  };
}
