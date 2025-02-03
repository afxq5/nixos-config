{ options, config, lib, pkgs, ... }:
with lib;
with lib.afxq;
let cfg = config.afxq.develop.lua;
in {
  options.afxq.develop.lua = with types; {
    enable = mkBoolOpt false "Whether or not to enable lua.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lua
      lua54Packages.cjson
      lua54Packages.luarocks
    ];
  };
}
