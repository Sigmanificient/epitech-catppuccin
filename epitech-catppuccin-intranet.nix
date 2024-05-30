{
  stdenvNoCC,
  sass,
}:
stdenvNoCC.mkDerivation {
  name = "epitech-catppuccin-intranet";
  version = "2.0.0";

  src = ./.;

  buildInputs = [sass];

  buildPhase = ''
    scss $src/style.scss -t compressed > style.css
  '';

  installPhase = ''
    cp style.css $out
  '';
}
