{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.tmux;
in {
  options.afxq.apps.tmux = with types; {
    enable = mkBoolOpt false "Whether or not to enable tmux.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ tmux ]; };
}
