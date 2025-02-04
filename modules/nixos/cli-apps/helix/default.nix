{ inputs, lib, config, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.cli-apps.helix;
in {
  options.afxq.cli-apps.helix = with types; {
    enable = mkBoolOpt false "Whether or not to enable neovim.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ helix ]; };
}
