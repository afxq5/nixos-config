{ config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.tools.attic;
in {
  options.afxq.tools.attic = { enable = mkEnableOption "Attic"; };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ attic ]; };
}
