# Epitech Intra - Catppuccin Theme

*[Catppuccin](https://catppuccin.com/)-based Stylus Theme for [the epitech intranet](https://intra.epitech.eu).*

Credits to the following project, which i took inpiration from:

- [EPITECH - Flat Intranet](https://uso.kkx.one/style/136022)
- [EPITECH - Dark Intranet](https://uso.kkx.one/style/237891)

## Build

### using 🌸 <samp>nix</samp>

```bash
nix build .
```

### other

```bash
sass -s compressed style.scss \
  | python inject.py template.css \
  | tee style.css
```
