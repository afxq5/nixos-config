{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.zathura;
in {
  options.afxq.apps.zathura = with types; {
    enable = mkBoolOpt false "Whether or not to enable zathura.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; with pkgs.afxq; [ zathura ];
  };
}
