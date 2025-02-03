{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.ani-cli;
in {
  options.afxq.apps.ani-cli = with types; {
    enable = mkBoolOpt false "Whether or not to enable ani-cli.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.afxq;
      [
        # ani-cli
      ];
  };
}
