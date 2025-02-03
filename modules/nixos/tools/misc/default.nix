{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.tools.misc;
in {
  options.afxq.tools.misc = with types; {
    enable = mkBoolOpt false "Whether or not to enable common utilities.";
  };

  config = mkIf cfg.enable {
    afxq.home.configFile."wgetrc".text = "";

    environment.systemPackages = with pkgs; [
      chezmoi
      procs
      htop
      pipes-rs
      gtypist
      ttyper
      fzf
      killall
      unzip
      file
      jq
      clac
      wget
    ];
  };
}
