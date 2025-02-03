inputs@{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.cli-apps.flake;
in {
  options.afxq.cli-apps.flake = with types; {
    enable = mkBoolOpt false "Whether or not to enable flake.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ snowfallorg.flake zoxide ];
  };
}
