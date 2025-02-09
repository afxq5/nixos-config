{ lib, pkgs, config, osConfig ? { }, format ? "unknown", namespace, ... }:

with lib.${namespace}; {
  afxq = {
    user = {
      enable = true;
      name = "afxq";
    };
    apps = {
      # hyprland = enabled;
      i3status = enabled;
      themes = enabled;
    };
    cli-apps = {
      home-manager = enabled;
      # nixvim = enabled;
    };
  };
}
