{
  pkgs ? import <nixpkgs> {},
  lib ? pkgs.lib,
}:
let
  originalPackage = pkgs.openmw;
  OpenMW-Override = originalPackage.overrideAttrs (old: {
    name = "openmw-overridden";

    buildCommand = ''
      set -euo pipefail

      ${
        lib.concatStringsSep "\n"
          (map
            (outputName:
              ''
                echo "Copying output ${outputName}"
                set -x
                cp -rs --no-preserve=mode "${originalPackage.${outputName}}" "''$${outputName}"
                set +x
              ''
            )
            (old.outputs or ["out"])
          )
      }
      cp -a --no-preserve=mod ${./omwfx-shaders}/. "$out/share/games/openmw/resources/"
    '';

  });
in
  OpenMW-Override

