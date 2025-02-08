{ lib, pkgs, fetchFromGitHub, ... }:
with lib.afxq;
let
  theme = rec {
    name = "abstractdark";
    version = "20161002";
    src = pkgs.fetchFromGitHub {
      owner = "3ximus";
      repo = "${name}-sddm-theme";
      rev = "e817d4b27981080cd3b398fe928619ffa16c52e7";
      sha256 = "1si141hnp4lr43q36mbl3anlx0a81r8nqlahz3n3l7zmrxb56s2y";
    };
    deps = with pkgs; [ ];
    inherit pkgs;
  };
in mkSddmTheme theme
