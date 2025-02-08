{ lib, namespace, ... }: {
  mkSddmTheme = { pkgs, name, version, src, deps ? [ ], init ? [ ] }:
    pkgs.stdenv.mkDerivation rec {
      pname = "sddm-theme-${name}";
      inherit version src;
      buildInput = deps;
      buildCommand = ''
        dir=$out/share/sddm/themes/${name}
        doc=$out/share/doc/${pname}

        mkdir -p $dir $doc
        if [ -d $src/${name} ]; then
          srcDir=$src/${name}
        else
          srcDir=$src
        fi
        cp -r $srcDir/* $dir/
        for f in $dir/{AUTHORS,COPYING,LICENSE,README,*.md,*.txt}; do
          test -f $f && mv $f $doc/
        done
        chmod 444 $dir/theme.conf

        ${lib.concatMapStringsSep "\n" (e: ''
          ${pkgs.crudini}/bin/crudini --set --inplace $dir/theme.conf \
            "${e.section}" "${e.key}" "${e.value}"
        '') init}
      '';
    };
}
