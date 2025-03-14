{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.tools.direnv;
in {
  options.afxq.tools.direnv = with types; {
    enable = mkBoolOpt false "Whether or not to enable direnv.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        direnv
        nix-direnv
      ];
  };
}
