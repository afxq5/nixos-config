{ options, config, pkgs, lib, inputs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.home;
in {
  imports = with inputs; [ home-manager.nixosModules.home-manager ];

  options.afxq.home = with types; {
    file = mkOpt attrs { }
      "A set of files to be managed by home-manager's <option>home.file</option>.";
    configFile = mkOpt attrs { }
      "A set of files to be managed by home-manager's <option>xdg.configFile</option>.";
    extraOptions = mkOpt attrs { } "Options to pass directly to home-manager.";
  };

  config = {
    afxq.home.extraOptions = {
      home.stateVersion = config.system.stateVersion;
      home.file = mkAliasDefinitions options.afxq.home.file;
      xdg.enable = true;
      xdg.configFile = mkAliasDefinitions options.afxq.home.configFile;
    };

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
      users.${config.afxq.user.name} =
        mkAliasDefinitions options.afxq.home.extraOptions;
    };
  };
}
