pkgs: with pkgs.vscode-extensions; [
  serayuzgur.crates
  vadimcn.vscode-lldb
  ms-python.black-formatter
  tamasfe.even-better-toml
  github.github-vscode-theme
  ecmel.vscode-html-css
  k--kato.intellij-idea-keybindings
  ms-toolsai.jupyter
  ms-python.python
  charliermarsh.ruff
  rust-lang.rust-analyzer
  bradlc.vscode-tailwindcss
  myriad-dreamin.tinymist 
  vscodevim.vim
  tomoki1207.pdf
  redhat.vscode-yaml
  mkhl.direnv
  streetsidesoftware.code-spell-checker
  jnoortheen.nix-ide
  mathiasfrohlich.kotlin
] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-openapi";
    publisher = "42crunch";
    version = "4.31.0";
    sha256 = "sha256-ZS47eAKQBHB2ijNlMu1sVN/3U3vT7E7AMdC/9HN4uCg=";
  }
  {
    name = "vscode-glsllint";
    publisher = "dtoplak";
    version = "1.9.0";
    sha256 = "sha256-Ic5yCR9CIaYylw0wPSL7lgSk+2f2O/pYkWKGKJNwm0g=";
  }
  {
    name = "vscode-wasm";
    publisher = "dtsvet";
    version = "1.4.1";
    sha256 = "sha256-zs7E3pxf4P8kb3J+5zLoAO2dvTeepuCuBJi5s354k0I=";
  }
  {
    name = "wgsl";
    publisher = "polymeilex";
    version = "0.1.17";
    sha256 = "sha256-vGqvVrr3wNG6HOJxOnJEohdrzlBYspysTLQvWuP0QIw=";
  }
  {
    name = "shader";
    publisher = "slevesque";
    version = "1.1.5";
    sha256 = "sha256-Pf37FeQMNlv74f7LMz9+CKscF6UjTZ7ZpcaZFKtX2ZM=";
  }
  {
    name = "wit-idl";
    publisher = "bytecodealliance";
    version = "0.3.9";
    sha256 = "sha256-FsE/oop7X4lhotbt0TbNyzeUvy+IGK3MXVorZVux8qk=";
  }
  # {
  #   name = "vscode-sqlfluff";
  #   publisher = "dorzey";
  #   version = "3.3.1";
  #   sha256 = "sha256-oRxITH6PWTvKvpyTwGDzEFJ4Hhjt5bP7FAm8moN5Jo8=";
  # }
]
