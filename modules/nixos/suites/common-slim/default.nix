{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.suites.common-slim;
in {
  options.afxq.suites.common-slim = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common-slim configuration.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.afxq.list-iommu ];

    afxq = {
      nix = enabled;

      # @TODO(jakehamilton): Enable this once Attic is configured again.
      # cache.public = enabled;

      #     cli-apps = {
      #      flake = enabled;
      #    };

      tools = {
        git = enabled;
        #     fup-repl = enabled;
        #     comma = enabled;
        #     bottom = enabled;
        #     direnv = enabled;
      };

      hardware = {
        #        storage = enabled;
        # networking = enabled;
      };

      services = { openssh = enabled; };

      security = { doas = enabled; };

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
