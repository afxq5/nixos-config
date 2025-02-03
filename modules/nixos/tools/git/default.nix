{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.tools.git;
in {
  options.afxq.tools.git = with types; {
    enable = mkBoolOpt false "Whether or not to enable git.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ gitFull lazygit ];
  };
}
