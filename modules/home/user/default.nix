{ lib, config, pkgs, osConfig ? { }, ... }:

let
  inherit (lib) types mkIf mkDefault mkMerge;
  inherit (lib.afxq) mkOpt;

  cfg = config.afxq.user;
  home-directory = if cfg.name == null then null else "/home/${cfg.name}";
in {
  options.afxq.user = {
    enable = mkOpt types.bool false "Whether to configure the user account.";
    name = mkOpt (types.nullOr types.str) "afxq" "The user account.";

    fullName = mkOpt types.str "Abdallah Ali" "The full name of the user.";
    email = mkOpt types.str "amaali1991@gmail.com" "The email of the user.";

    home = mkOpt (types.nullOr types.str) home-directory
      "The user's home directory.";
  };

  config = mkIf cfg.enable (mkMerge [{
    snowfallorg.user = {
      enable = true;
      name = "name";
      # home = "/home/afxq/";
    };

    assertions = [
      {
        assertion = cfg.name != null;
        message = "afxq.user.name must be set";
      }
      {
        assertion = cfg.home != null;
        message = "afxq.user.home must be set";
      }
    ];

    home = {
      username = mkDefault cfg.name;
      homeDirectory = mkDefault cfg.home;
    };
  }]);
}
