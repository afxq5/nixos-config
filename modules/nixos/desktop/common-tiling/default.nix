{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.desktop.common-tiling;
in {
  options.afxq.desktop.common-tiling = with types; {
    enable = mkBoolOpt false "Whether or not to enable common-tiling.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      with pkgs.afxq; [
        arandr
        lxappearance
        gvfs
        dex
        redshift
        # picom
        bat
        eza
        light
        playerctl
        maim
        jq
        brightnessctl
        upower
        inotify-tools
        acpid
        wmctrl
        nitrogen
        xdotool
        xclip
        scrot
        acpi
        dunst
        # Rust Base
        # yazi
        lsd
      ];
  };
}
