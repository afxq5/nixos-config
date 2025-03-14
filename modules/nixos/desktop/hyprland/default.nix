{ options, config, lib, pkgs, inputs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.desktop.hyprland;
in {
  options.afxq.desktop.hyprland = with types; {
    enable = mkBoolOpt false "Whether or not to enable hyprland .";
  };

  config = mkIf cfg.enable {
    hardware.graphics = {
      enable32Bit = true;
      enable = true;
    };
    environment.sessionVariables =
      lib.mkForce { QT_QPA_PLATFORMTHEME = "qtct"; };
    programs.hyprland = {
      enable = true;
      xwayland = enabled;
    };
    environment.systemPackages = with pkgs; [
      kdePackages.polkit-kde-agent-1
      kdePackages.qt6ct
      kdePackages.dolphin
      gammastep
      bc
      kdePackages.systemsettings
      fish
      gnome-bluetooth
      strawberry
      nwg-look
      blueman
      # qt6Packages.qtstyleplugin-kvantum
      libsForQt5.kconfig
      kdePackages.qtstyleplugin-kvantum
      kdePackages.konsole
      kdePackages.plasma-workspace
      kdePackages.kconfig
      python312Packages.pillow
      glib
      gsettings-qt
      bun
      # ------
      foot
      grim
      slurp
      swww
      fish
      light
      swaylock-effects
      swayidle
      theme-sh
      xdg-desktop-portal-hyprland
      starship
      cava
      imagemagick
      gnome-bluetooth
      libdbusmenu-gtk3
      wl-clipboard
      # ------
      wofi
      swaybg
      wlsunset
      brightnessctl
      wl-gammactl
      wl-clipboard
      wf-recorder
      hyprpicker
      imagemagick
      hyprpaper
      slurp
      kitty
      sassc
      watershot
      hyprland
      hyprland-protocols
      # hyprland-share-picker
      xdg-desktop-portal-hyprland
      wlprop
      inputs.hyprland-contrib.packages.${pkgs.system}.hyprprop
      # inputs.kmyc.defaultPackage.${pkgs.system}
      inputs.ags.packages.${pkgs.system}.ags
    ];

  };
}
