{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.web;
in {
  options.afxq.develop.web = with types; {
    enable = mkBoolOpt false "Whether or not to enable web.";
  };

  config = mkIf cfg.enable {
    afxq = {
      apps = {
        altair = enabled;
        # drawio = enabled;
        docker = enabled;
      };
    };
    environment.systemPackages = with pkgs; [
      html-tidy
      nodePackages.stylelint
      nodePackages.js-beautify
      nodePackages.javascript-typescript-langserver
    ];
  };
}
