pkgs: with pkgs.vscode-extensions; [
  serayuzgur.crates
  vadimcn.vscode-lldb
  tamasfe.even-better-toml
  github.github-vscode-theme
  ecmel.vscode-html-css
  k--kato.intellij-idea-keybindings
  rust-lang.rust-analyzer
  myriad-dreamin.tinymist 
  vscodevim.vim
  tomoki1207.pdf
  redhat.vscode-yaml
  mkhl.direnv
  streetsidesoftware.code-spell-checker
  jnoortheen.nix-ide
  valentjn.vscode-ltex
] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-wasm";
    publisher = "dtsvet";
    version = "1.4.1";
    sha256 = "sha256-zs7E3pxf4P8kb3J+5zLoAO2dvTeepuCuBJi5s354k0I=";
  }
  # {
  #   name = "vscode-sqlfluff";
  #   publisher = "dorzey";
  #   version = "3.3.1";
  #   sha256 = "sha256-oRxITH6PWTvKvpyTwGDzEFJ4Hhjt5bP7FAm8moN5Jo8=";
  # }
]
