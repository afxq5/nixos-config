{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.tools.comma;
in {
  options.afxq.tools.comma = with types; {
    enable = mkBoolOpt false "Whether or not to enable comma.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      [
        comma
				ffmpeg-full
        # afxq.nix-update-index
      ];

    afxq.home = {
      configFile = { "wgetrc".text = ""; };

      # extraOptions = { programs.nix-index.enable = true; };
    };
  };
}
