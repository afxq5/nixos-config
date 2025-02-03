{ options, config, lib, pkgs, inputs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.tools.nix-ld;
in {
  options.afxq.tools.nix-ld = with types; {
    enable = mkBoolOpt false "Whether or not to enable nix-ld.";
  };

  config = mkIf cfg.enable {
    programs.nix-ld.enable = true;
    environment.systemPackages = [
      inputs.nix-alien.packages.${pkgs.system}.nix-alien
    ];
  };
}
