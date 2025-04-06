{ pkgs, firefox-addons, ... }:
with firefox-addons.packages.${pkgs.system}; [
  ublock-origin
  darkreader
  return-youtube-dislikes
  stylus
]
