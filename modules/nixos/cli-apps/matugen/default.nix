{ inputs, lib, config, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.cli-apps.matugen;
in {
  options.afxq.cli-apps.matugen = with types; {
    enable = mkBoolOpt false "Whether or not to enable mutugen.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = [ inputs.matugen.packages.${pkgs.system}.default ]; };
}
