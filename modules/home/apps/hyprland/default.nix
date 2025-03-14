{ lib, pkgs, config, inputs, ... }:

let
  inherit (lib) mkEnableOption mkIf mkForce;
  inherit (lib.afxq) enabled;
  user = config.afxq.user;
  homeD = if user.name == null then null else "/home/${user.name}";

  cfg = config.afxq.apps.hyprland;
in {
  options.afxq.apps.hyprland = { enable = mkEnableOption "Hyprland"; };

  config = mkIf cfg.enable {
    qt.enable = true;
    #qt.platformTheme.name = "qtct";
    # home.file."${config.xdg.configHome}" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "${homeD}/.dotfiles/config/";
    #   recursive = true;
    # };
    # home.file.".local" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "${homeD}/.dotfiles/local/";
    #   recursive = true;
    # };
    # home.file.".fonts" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "${homeD}/.dotfiles/fonts/";
    #   recursive = true;
    # };
    home.activation.linkMyFiles =
      config.lib.dag.entryAfter [ "writeBoundary" ] ''
        # Config
        ln -snf $HOME/.dotfiles/config/hypr/ $HOME/.config/hypr
        ln -snf $HOME/.dotfiles/config/ags/ $HOME/.config/ags
        ln -snf $HOME/.dotfiles/config/easyeffects/ $HOME/.config/easyeffects
        ln -snf $HOME/.dotfiles/config/Kvantum/ $HOME/.config/Kvantum
        ln -snf $HOME/.dotfiles/config/qt5ct/ $HOME/.config/qt5ct
        ln -snf $HOME/.dotfiles/config/qt6ct/ $HOME/.config/qt6ct
        ln -snf $HOME/.dotfiles/config/wofi/ $HOME/.config/wofi
        ln -snf $HOME/.dotfiles/config/gammastep.conf $HOME/.config/gammastep.conf
        # Local
        ln -snf $HOME/.dotfiles/local/share/konsole/ $HOME/.local/share/konsole
        ln -snf $HOME/.dotfiles/local/share/color-schemes/ $HOME/.local/share/color-schemes
        # Fonts
        ln -snf $HOME/.dotfiles/fonts/ $HOME/.fonts
        ln -snf $HOME/.dotfiles/ahmed-config.json $HOME/.ahmed-config.json
      '';
  };
}
