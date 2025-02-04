{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.apps.emacs;
in {
  options.afxq.apps.emacs = with types; {
    enable = mkBoolOpt false "Whether or not to enable altair.";
  };

  config = mkIf cfg.enable {

    # services = {
    #   emacs = {
    #     defaultEditor = true;
    #     enable = true;
    #     package = pkgs.emacs29;
    #   };
    # };
    environment.systemPackages = with pkgs; [
      emacs30
      pandoc
      graphviz
      markdownlint-cli2
      proselint
      multimarkdown
      coreutils-prefixed
    ];
  };
}
