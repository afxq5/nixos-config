{ lib, pkgs, config, osConfig ? { }, format ? "unknown", namespace, ... }:

with lib.${namespace}; {
  afxq = {
    user = {
      enable = true;
      name = "afxq";
    };
    apps = {
      hyprland = enabled;
<<<<<<< HEAD:homes/x86_64-linux/afxq@afxq/default.nix
      # i3status = enabled;
=======
>>>>>>> e3907b6 (teams-for-linux):homes/x86_64-linux/afxq@laptop/default.nix
      themes = enabled;
    };
    cli-apps = {
      home-manager = enabled;
      # nixvim = enabled;
    };
  };
}
