{ options, config, lib, pkgs, ... }:

with lib;
with lib.afxq;
let cfg = config.afxq.archetypes.server;
in {
  options.afxq.archetypes.server = with types; {
    enable = mkBoolOpt false "Whether or not to enable the server archetype.";
  };

  config = mkIf cfg.enable {
    afxq = {
      suites = { common-slim = enabled; };

      cli-apps.neovim = enabled;
      tools.git = enabled;

    };
  };
}
