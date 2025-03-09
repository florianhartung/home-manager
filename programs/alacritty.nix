{ pkgs, ... }:
{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    terminal.shell = "${pkgs.fish}/bin/fish";
    window.opacity = 0.85;
    font = {
      normal = { family = "Jetbrains Mono"; };
      size = 13;
    };
  };
}
