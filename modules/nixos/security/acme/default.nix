{ lib, pkgs, config, virtual, ... }:

let
  inherit (lib) mkIf mkEnableOption optional;
  inherit (lib.afxq) mkOpt;

  cfg = config.afxq.security.acme;
in
{
  options.afxq.security.acme = with lib.types; {
    enable = mkEnableOption "default ACME configuration";
    email = mkOpt str config.afxq.user.email "The email to use.";
    staging = mkOpt bool virtual "Whether to use the staging server or not.";
  };

  config = mkIf cfg.enable {
    security.acme = {
      acceptTerms = true;

      defaults = {
        inherit (cfg) email;

        group = mkIf config.services.nginx.enable "nginx";
        server = mkIf cfg.staging
          "https://acme-staging-v02.api.letsencrypt.org/directory";

        # Reload nginx when certs change.
        reloadServices = optional config.services.nginx.enable "nginx.service";
      };
    };
  };
}
