{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.apps.surrealdb;
in {
  options.afxq.apps.surrealdb = with types; {
    enable = mkBoolOpt false "Whether or not to enable Pocketcasts.";
  };

  config = mkIf cfg.enable {
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 5321 ];
      allowedUDPPortRanges = [
        {
          from = 5300;
          to = 5330;
        }
        {
          from = 8000;
          to = 8010;
        }
      ];
    };
    services.surrealdb = {
      enable = true;
      # port = 5321;
      # host = "127.0.0.1";
      extraFlags = [
        # "--allow-all"
        "--user root"
        "--pass root"
      ];
    };

  };
}
