{
  stdenvNoCC,
  dart-sass,
  lib,
  writers
}:
let
 inject = writers.writePython3Bin "inject" {}
  (builtins.readFile ./inject.py);
in
stdenvNoCC.mkDerivation {
  name = "epitech-catppuccin-intranet";
  version = "2.0.0";

  src = ./.;

  buildInputs = [dart-sass];

  buildPhase = ''
    sass -s compressed style.scss \
      | ${lib.getExe inject} ${./template.css} | tee style.css
  '';

  installPhase = ''
    cp style.css $out
  '';
}
