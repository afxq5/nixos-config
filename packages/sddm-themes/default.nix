{ lib, pkgs, fetchFromGitHub, ... }:
with lib.afxq;
let
  theme = rec {
    name = "sugar-dark";
    version = "1.2";
    src = pkgs.fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-${name}";
      rev = "v${version}";
      sha256 = "0gx0am7vq1ywaw2rm1p015x90b75ccqxnb1sz3wy8yjl27v82yhb";
    };
    deps = with pkgs; [ ];
    inherit pkgs;
  };
in mkSddmTheme theme
