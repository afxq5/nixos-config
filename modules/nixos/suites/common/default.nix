{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.suites.common;
in {
  options.afxq.suites.common = with types; {
    enable = mkBoolOpt false "Whether or not to enable common configuration.";
  };

  config = mkIf cfg.enable {
    # environment.systemPackages = [
    #   pkgs.afxq.list-iommu
    # ];

    afxq = {
      nix = enabled;
      environment = enabled;
      # @TODO(jakehamilton): Enable this once Attic is configured again.
      # cache.public = enabled;

      cli-apps = { flake = enabled; };

      tools = {
        git = enabled;
        misc = enabled;
        fup-repl = enabled;
        comma = enabled;
        nix-ld = enabled;
        bottom = enabled;
        cli = enabled;
        archive = enabled;
      };

      hardware = {
        audio = enabled;
        storage = enabled;
        networking = enabled;
        video = enabled;
        bluetooth = enabled;
      };

      services = {
        printing = enabled;
        openssh = enabled;
      };

      security.enable = true;
      security = {
        gpg = enabled;
        doas = enabled;
        keyring = enabled;
      };

      system = {
        boot = enabled;
        fonts = enabled;
        locale = enabled;
        time = enabled;
        xkb = enabled;
      };
    };
  };
}
