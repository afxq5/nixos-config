{ lib, config, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.cli-apps.zellij;
in {
  options.afxq.cli-apps.zellij = { enable = mkEnableOption "zellij"; };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ zellij ]; };
}
