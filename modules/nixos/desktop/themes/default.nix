{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.desktop.themes;
in {
  options.afxq.desktop.themes = with types; {
    enable = mkBoolOpt false "Whether or not to enable themes.";
  };

  config = mkIf cfg.enable {
    # environment.sessionVariables = {
    #   QT_QPA_PLATFORMTHEME = "gtk2";
    # };

    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        # fonts
        (nerdfonts.override {
          fonts = [
            "FiraCode"
            "JetBrainsMono"
            "Ubuntu"
            "UbuntuMono"
            "CascadiaCode"
            "FantasqueSansMono"
            "FiraCode"
            "VictorMono"
            "Mononoki"
          ];
        })
        font-awesome

        # themes
        libsForQt5.qtstyleplugins
        qogir-theme # gtk
        papirus-icon-theme
        qogir-icon-theme
        whitesur-icon-theme
        colloid-icon-theme
        arc-theme
        gradience
        adw-gtk3
        arc-icon-theme
        dark-decay-gtk
        decayce-gtk
        material-symbols
jetbrains-mono
        monoco-nf
        sfmono-nf
        st
      ];
  };
}
