# Installation for Systems via NixOS

WIP



# Installation for Users via Home Manager

- Root user: Included in the NixOS installation by default (using a NixOS
  module).
- Normal users:
  1. Refer to the Home Manager Manual (Section "Nix Flakes" > "Standalone Setup").
  2. Clone this repository into `~/.config/home-manager`. You can "clone" a git
     repository with `GIT_URL` into an existing non-empty directory by adding it
     as a remote (as long as there are no conflicts):

     ```sh
     git init .
     git branch -M main
     git remote add origin GIT_URL
     git fetch origin
     git reset origin/main
     ```
